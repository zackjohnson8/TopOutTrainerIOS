//
//  StatsViewModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

class StatsViewModel
{
    var statsUIView:StatsUIView
    
    init(parent: StatsViewController)
    {
        let statsView = StatsUIView(parent: parent)
        self.statsUIView = statsView
    }
}
