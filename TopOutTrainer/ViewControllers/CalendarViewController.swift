//
//  CalendarViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

protocol CalendarViewControllerDelegate: AnyObject
{
    func backPressed()
}

class CalendarViewController: UIViewController
{
    
    weak var delegate:CalendarViewControllerDelegate?
    
    var calendarViewModel:CalendarViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configUI()
        
    }
}

extension CalendarViewController
{
    
    func configUI()
    {
        let calendarViewModel = CalendarViewModel(parent: self)
        self.calendarViewModel = calendarViewModel
        self.view.addSubview(calendarViewModel.calendarUIView)
    }
    
}
