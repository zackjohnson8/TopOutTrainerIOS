//
//  WeightsViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

protocol WeightsViewControllerDelegate: AnyObject
{
    func backPressed()
}

class WeightsViewController: UIViewController
{
    
    weak var delegate:WeightsViewControllerDelegate?
    
    var weightsViewModel:WeightsViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configUI()
        
    }
}

extension WeightsViewController
{
    
    func configUI()
    {
        let weightsViewModel = WeightsViewModel(parent: self)
        self.weightsViewModel = weightsViewModel
        self.view.addSubview(weightsViewModel.weightsUIView)
    }
    
}
