//
//  TimerViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 2/13/21.
//

import UIKit

protocol TimerViewControllerDelegate: AnyObject
{
    func backPressed()
}

class TimerViewController: UIViewController
{
    
    weak var delegate:TimerViewControllerDelegate?
    
    var timerViewModel:TimerViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configUI()
        
    }
}

extension TimerViewController
{
    
    func configUI()
    {
        let timerViewModel = TimerViewModel(parent: self)
        self.timerViewModel = timerViewModel
        self.view.addSubview(timerViewModel.timerUIView)
    }
    
}
