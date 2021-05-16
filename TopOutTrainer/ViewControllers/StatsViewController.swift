//
//  StatsViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

protocol StatsViewControllerDelegate: AnyObject
{
    func backPressed()
}

class StatsViewController: UIViewController
{
    
    weak var delegate:StatsViewControllerDelegate?
    
    var statsViewModel:StatsViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configUI()
        
    }
}

extension StatsViewController
{
    
    func configUI()
    {
        let statsViewModel = StatsViewModel(parent: self)
        self.statsViewModel = statsViewModel
        self.view.addSubview(statsViewModel.statsUIView)
    }
    
}
