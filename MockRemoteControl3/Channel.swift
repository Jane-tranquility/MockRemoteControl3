//
//  Channel.swift
//  MockRemoteControl3
//
//  Created by LiJing on 3/1/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import Foundation

class Channel{
    var indexNumber:Int
    var label:String
    var channelNumber:Int
    init (at index:Int, for label:String, on channel:Int){
        self.indexNumber=index
        self.label=label
        self.channelNumber=channel
    }
}
