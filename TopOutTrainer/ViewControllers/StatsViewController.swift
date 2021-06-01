//
//  StatsViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit

public enum Event {
    case timer,
         weights,
         stats,
         calendar
}

protocol StatsViewControllerDelegate: AnyObject {
    func statsButtonPressed(event: Event)
}

final class StatsViewController: UIViewController
{
    var statsModel: StatsViewModel!
    var statsView: StatsUIView!
    
    weak var delegate: StatsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .primaryColor()
        
        statsModel = StatsViewModel(self)
        statsModel.delegate = self
        
        configUI()
    }
}

private extension StatsViewController
{
    /**
     Summary: Handles calling all the configure UI functions
     */
    private func configUI()
    {
        setNavBar()
        setViewWindow()
    }

    /**
     Summary: Set the navigationItem's variables from the statsModel
     */
    private func setNavBar()
    {
        self.navigationItem.rightBarButtonItem = statsModel.rightBarItem
        self.navigationItem.title = statsModel.title
        self.navigationController?.navigationBar.layer.cornerRadius = 20
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 40)!]
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /**
     Summary: Populate statsView using containers stored in statsModel. The UIView is used for displaying
     the stats buttons to navigate through the application. For example this might be a square timer button which displays
     a clock, creates a shadow of the same color that it is set to, and triggers a new UIViewController for the timer screen.
     */
    private func setViewWindow()
    {
        statsView = statsModel.statsView
        self.view.addSubview(statsView)
    }
    
}

extension StatsViewController: StatsViewModelDelegate
{
    func onStatsButtonPressed(buttonType: ButtonType) {
        if buttonType == ButtonType.timer
        {
            print("StatsViewModelDelegate call onStatsButtonPressed")
            self.delegate?.statsButtonPressed(event: .timer)
        }else
        if buttonType == ButtonType.stats
        {
            print("StatsViewModelDelegate call onStatsButtonPressed")
            self.delegate?.statsButtonPressed(event: .stats)
        }else
        if buttonType == ButtonType.calendar
        {
            print("StatsViewModelDelegate call onStatsButtonPressed")
            self.delegate?.statsButtonPressed(event: .calendar)
        }else
        if buttonType == ButtonType.weights
        {
            print("StatsViewModelDelegate call onStatsButtonPressed")
            self.delegate?.statsButtonPressed(event: .weights)
        }else
        {
            print("Error: Could not find the correct stats button")
        }
    }
    
    
}


