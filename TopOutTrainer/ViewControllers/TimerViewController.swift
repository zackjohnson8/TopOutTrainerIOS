//
//  TimerViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 2/13/21.
//

import Foundation
import UIKit

class TimerViewController: UIViewController
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setViewWindow()
    {
        #warning("DEMO View")
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        view.backgroundColor = .green
        self.view.addSubview(view)
    }
    
}
