//
//  WeightsViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

final class WeightsViewCoordinator: PresentationCoordinator
{
    typealias ViewController = WeightsViewController
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: WeightsViewController

    init()
    {
        rootViewController = WeightsViewController()
    }
    
    func start() {
        rootViewController.delegate = self
    }
    
    
}

extension WeightsViewCoordinator: WeightsViewControllerDelegate
{
    func backPressed() {
        #warning("implement maybe?")
    }
}
