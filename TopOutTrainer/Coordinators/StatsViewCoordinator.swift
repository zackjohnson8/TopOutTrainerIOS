//
//  StatsViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

final class StatsViewCoordinator: PresentationCoordinator
{
    typealias ViewController = StatsViewController
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: StatsViewController

    init()
    {
        rootViewController = StatsViewController()
    }
    
    func start() {
        rootViewController.delegate = self
    }
    
    
}

extension StatsViewCoordinator: StatsViewControllerDelegate
{
    func backPressed() {
        #warning("implement maybe?")
    }
}
