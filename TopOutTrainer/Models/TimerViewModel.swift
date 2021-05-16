//
//  TimerViewModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/10/21.
//

import UIKit

class TimerViewModel
{
    var timerUIView:TimerUIView
    
    init(parent: TimerViewController)
    {
        let timerView = TimerUIView(parent: parent)
        self.timerUIView = timerView
    }
}
