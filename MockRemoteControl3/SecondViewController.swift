//
//  SecondViewController.swift
//  MockRemoteControl3
//
//  Created by LiJing on 2/28/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var powerValue: UISwitch!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    func actionSheet(for m:String){
        let title="Invalid Action!"
        let message=m+" button can't be pressed in current mode!"
        let alertController=UIAlertController(title: title, message:message, preferredStyle:.actionSheet)
        let cancelAction=UIAlertAction(title:"Cancel", style:.default)
        let forceAction=UIAlertAction(title: "Go Anyway!", style:.destructive){action in
            let alertPop=UIAlertController(title: "Alert:",message:"The current operation has been stopped, and proceed to the required operation!",preferredStyle:.alert)
            let confirmAction=UIAlertAction(title:"Got it!", style:.cancel){action in
                //self.stateLabel.text="State:               \(m)"
                if m=="Play"{self.stateLabel.text="State:            Playing"}
                else if m=="Stop"{self.stateLabel.text="State:            Stopped"}
                else if m=="Pause"{self.stateLabel.text="State:            Paused"}
                else if m=="Fast Forward"{self.stateLabel.text="State:            Fast Forwarding"}
                else if m=="Fast Rewind"{self.stateLabel.text="State:            Fast Rewinding"}
                else if m=="Record"{self.stateLabel.text="State:            Recording"}
            }
            alertPop.addAction(confirmAction)
            self.present(alertPop, animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(forceAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        powerLabel.text="DVR power:            "+(sender.isOn ? "On" : "Off")
        powerValue.setOn(sender.isOn, animated: true)
        if sender.isOn==false{
            stateLabel.isEnabled=false
            playButton.isEnabled=false
            stopButton.isEnabled=false
            pauseButton.isEnabled=false
            forwardButton.isEnabled=false
            rewindButton.isEnabled=false
            recordButton.isEnabled=false
        }else{
            stateLabel.isEnabled=true
            stateLabel.text="State:            Stopped"
            playButton.isEnabled=true
            stopButton.isEnabled=true
            pauseButton.isEnabled=true
            forwardButton.isEnabled=true
            rewindButton.isEnabled=true
            recordButton.isEnabled=true
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let button=sender.currentTitle{
            if stateLabel.text=="State:            Playing"{
                if button=="Record"{
                    actionSheet(for:button)
                }else{
                    if button=="Play"{
                        stateLabel.text="State:            Playing"
                    }else if button=="Stop"{
                        stateLabel.text="State:            Stopped"
                    }else if button=="Pause"{
                        stateLabel.text="State:            Paused"
                    }else if button=="Fast Forward"{
                        stateLabel.text="State:            Fast Forwarding"
                    }else if button=="Fast Rewind"{
                        stateLabel.text="State:            Fast Rewinding"
                    }
                }
                
            }else if stateLabel.text=="State:            Stopped"{
                if button=="Pause"||button=="Fast Forward"||button=="Fast Rewind"{
                    actionSheet(for:button)
                }else{
                    if button=="Play"{
                        stateLabel.text="State:            Playing"
                    }else if button=="Stop"{
                        stateLabel.text="State:            Stopped"
                    }else if button=="Record"{
                        stateLabel.text="State:            Recording"
                    }
                }
                
            }else if stateLabel.text=="State:            Paused"{
                if button=="Fast Forward"||button=="Record"||button=="Fast Rewind"{
                    actionSheet(for:button)
                }else{
                    if button=="Play"{
                        stateLabel.text="State:            Playing"
                    }else if button=="Stop"{
                        stateLabel.text="State:            Stopped"
                    }else if button=="Pause"{
                        stateLabel.text="State:            Paused"
                    }
                }
                
            }else if stateLabel.text=="State:            Fast Forwarding"{
                if button=="Pause"||button=="Record"||button=="Fast Rewind"{
                    actionSheet(for:button)
                }else{
                    if button=="Play"{
                        stateLabel.text="State:            Playing"
                    }else if button=="Stop"{
                        stateLabel.text="State:            Stopped"
                    }else if button=="Fast Forward"{
                        stateLabel.text="State:            Fast Forwarding"
                    }
                }
                
            }else if stateLabel.text=="State:            Fast Rewinding"{
                if button=="Pause"||button=="Record"||button=="Fast Forward"{
                    actionSheet(for:button)
                }else{
                    if button=="Play"{
                        stateLabel.text="State:            Playing"
                    }else if button=="Stop"{
                        stateLabel.text="State:            Stopped"
                    }else if button=="Fast Rewind"{
                        stateLabel.text="State:            Fast Rewinding"
                    }
                }
                
            }else if stateLabel.text=="State:            Recording"{
                if button=="Pause"||button=="Fast Rewind"||button=="Fast Forward"{
                    actionSheet(for:button)
                }else{
                    if button=="Play"{
                        stateLabel.text="State:            Playing"
                    }else if button=="Stop"{
                        stateLabel.text="State:            Stopped"
                    }else if button=="Record"{
                        stateLabel.text="State:            Recording"
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        powerValue.isOn=true
        powerLabel.text="DVR power:              On"
        stateLabel.text="State:            Stopped"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

