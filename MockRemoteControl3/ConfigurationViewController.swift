//
//  ConfigurationViewController.swift
//  MockRemoteControl3
//
//  Created by LiJing on 3/1/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import UIKit

var favoriteChannel1:Channel?=nil
var favoriteChannel2:Channel?=nil
var favoriteChannel3:Channel?=nil
var favoriteChannel4:Channel?=nil

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var favoriteChannels: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channelStepper: UIStepper!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        channelLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let button=sender.currentTitle{
            if button=="Cancel"{
                textField.text=""
                channelLabel.text="1"
                channelStepper.value=1
            }else if button=="Save"{
                if let text=textField.text{
                    if text.isEmpty || text.characters.count>3{
                        let title="Alert!"
                        let message="you need to type in a channel which has less than three characters!"
                        let alertControl=UIAlertController(title:title, message:message, preferredStyle:.alert)
                        let okayAction=UIAlertAction(title:"okay", style:.destructive)
                        alertControl.addAction(okayAction)
                        present(alertControl, animated: true, completion: nil)
                    }else{
                        if favoriteChannels.selectedSegmentIndex==0{
                            favoriteChannel1=Channel(at:favoriteChannels.selectedSegmentIndex, for:text, on: Int(channelStepper.value))
                            favoriteChannels.setTitle(text, forSegmentAt: 0)
                            textField.text=""
                            channelLabel.text="1"
                            channelStepper.value=1
                        }else if favoriteChannels.selectedSegmentIndex==1{
                            favoriteChannel2=Channel(at:favoriteChannels.selectedSegmentIndex, for:text, on: Int(channelStepper.value))
                            favoriteChannels.setTitle(text, forSegmentAt: 1)
                            textField.text=""
                            channelLabel.text="1"
                            channelStepper.value=1
                        }else if favoriteChannels.selectedSegmentIndex==2{
                            favoriteChannel3=Channel(at:favoriteChannels.selectedSegmentIndex, for:text, on: Int(channelStepper.value))
                            favoriteChannels.setTitle(text, forSegmentAt: 2)
                            textField.text=""
                            channelLabel.text="1"
                            channelStepper.value=1
                        }else {
                            favoriteChannel4=Channel(at:favoriteChannels.selectedSegmentIndex, for:text, on: Int(channelStepper.value))
                            favoriteChannels.setTitle(text, forSegmentAt: 3)
                            textField.text=""
                            channelLabel.text="1"
                            channelStepper.value=1
                        }
                        
                        
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        channelLabel.text="1"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
