//
//  FirstViewController.swift
//  MockRemoteControl3
//
//  Created by LiJing on 2/28/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumnLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumnSlider: UISlider!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var channelIncrease: UIButton!
    @IBOutlet weak var channelDecrease: UIButton!
    @IBOutlet weak var favChannel: UISegmentedControl!
    var count:Int=0
    var channel:Int=50
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        powerLabel.text="TV Power:            "+(sender.isOn ? "On" : "Off")
        powerSwitch.setOn(sender.isOn, animated: true)
        let enabled=sender.isOn==true
        volumnSlider.isEnabled=enabled
        zero.isEnabled=enabled
        one.isEnabled=enabled
        two.isEnabled=enabled
        three.isEnabled=enabled
        four.isEnabled=enabled
        five.isEnabled=enabled
        six.isEnabled=enabled
        seven.isEnabled=enabled
        eight.isEnabled=enabled
        nine.isEnabled=enabled
        channelIncrease.isEnabled=enabled
        channelDecrease.isEnabled=enabled
        favChannel.isEnabled=enabled
        volumnLabel.isEnabled=enabled
        channelLabel.isEnabled=enabled
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
         volumnLabel.text="Speaker Volumn: \(Int(sender.value))"
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let button=sender.currentTitle{
            if let num=Int(button){
                if count==0{
                    channel=num
                    count=1
                    channelLabel.text="Current Channel: \(channel)"
                }else{
                    let number=channel*10+num
                    if number>0&&number<100{
                        channel=number
                    }else if number<1{
                        channel=1
                    }else{
                        channel=99
                    }
                    count=0
                    if channel<10{
                        channelLabel.text="Current Channel: 0\(channel)"
                    }else{
                        channelLabel.text="Current Channel: \(channel)"
                    }
                }
            }else if button=="Ch +"{
                if channel<99{
                    channel=channel+1
                }else{
                    channel=99
                }
                if channel<10{
                    channelLabel.text="Current Channel: 0\(channel)"
                }else{
                    channelLabel.text="Current Channel: \(channel)"
                }
                //channelLabel.text="Current Channel:  \(channel)"
            }else{
                if channel>1{
                    channel=channel-1
                }else{
                    channel=1
                }
                if channel<10{
                    channelLabel.text="Current Channel: 0\(channel)"
                }else{
                    channelLabel.text="Current Channel: \(channel)"
                }
                //channelLabel.text="Current Channel:  \(channel)"
            }
        }
    }
    
    @IBAction func chooseSelected(_ sender: UISegmentedControl) {
        let index=sender.selectedSegmentIndex
        if index==0{
            if let fav1=favoriteChannel1 {
                channelLabel.text="Current Channel: \(fav1.channelNumber)"
            }else{
                if let name=sender.titleForSegment(at: sender.selectedSegmentIndex){
                    channelLabel.text="Current Channel: \(name)"
                }
            }
        }else if index==1{
            if let fav2=favoriteChannel2 {
                channelLabel.text="Current Channel: \(fav2.channelNumber)"
            }else{
                if let name=sender.titleForSegment(at: sender.selectedSegmentIndex){
                    channelLabel.text="Current Channel: \(name)"
                }
            }
        }else if index==2{
            if let fav3=favoriteChannel3 {
                channelLabel.text="Current Channel: \(fav3.channelNumber)"
            }else{
                if let name=sender.titleForSegment(at: sender.selectedSegmentIndex){
                    channelLabel.text="Current Channel: \(name)"
                }
            }
        }else if index==3{
            if let fav4=favoriteChannel4 {
                channelLabel.text="Current Channel: \(fav4.channelNumber)"
            }else{
                if let name=sender.titleForSegment(at: sender.selectedSegmentIndex){
                    channelLabel.text="Current Channel: \(name)"
                }
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //channelLabel.text="Current Channel:  \(channel)"
        volumnLabel.text="Speaker Volumn: \(Int(volumnSlider.value))"
        powerSwitch.isOn=true
        powerLabel.text="TV Power:            On"
        /*if let fav1=favoriteChannel1 {
            favChannel.setTitle(fav1.label, forSegmentAt: 0)
        }
        if let fav2=favoriteChannel2 {
            favChannel.setTitle(fav2.label, forSegmentAt: 1)
        }
        if let fav3=favoriteChannel3 {
            favChannel.setTitle(fav3.label, forSegmentAt: 2)
        }
        if let fav4=favoriteChannel4 {
            favChannel.setTitle(fav4.label, forSegmentAt: 3)
        }*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //channelLabel.text="Current Channel:  \(channel)"
        favChannel.selectedSegmentIndex=0
        if let fav1=favoriteChannel1 {
            favChannel.setTitle(fav1.label, forSegmentAt: 0)
            channelLabel.text="Current Channel:  \(fav1.channelNumber)"
        }else{
            if let name=favChannel.titleForSegment(at: favChannel.selectedSegmentIndex){
                channelLabel.text="Current Channel: \(name)"
            }
        }
        if let fav2=favoriteChannel2 {
            favChannel.setTitle(fav2.label, forSegmentAt: 1)
        }
        if let fav3=favoriteChannel3 {
            favChannel.setTitle(fav3.label, forSegmentAt: 2)
        }
        if let fav4=favoriteChannel4 {
            favChannel.setTitle(fav4.label, forSegmentAt: 3)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

