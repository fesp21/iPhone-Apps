//
//  BlockStatus.swift
//  Game
//
//  Created by Sandeep on 9/19/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import Foundation

class BlockStatus{
    
    var isRunning = false
    var timeGap = UInt32(0)
    var currentInterval = UInt32(0)
    init(isRunning:Bool,timeGap:UInt32,currentInterval:UInt32)
    {
        self.isRunning = isRunning
        self.timeGap = timeGap
        self.currentInterval = currentInterval
    }
   
    func shouldRunBlock() -> Bool
    {
        return self.currentInterval > self.timeGap
    }
    
}