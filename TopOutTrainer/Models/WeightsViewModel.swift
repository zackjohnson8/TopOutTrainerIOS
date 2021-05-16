//
//  WeightsViewModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

class WeightsViewModel
{
    var weightsUIView:WeightsUIView
    
    init(parent: WeightsViewController)
    {
        let weightsView = WeightsUIView(parent: parent)
        self.weightsUIView = weightsView
    }
}
