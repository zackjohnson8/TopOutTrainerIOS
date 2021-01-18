//
//  Coordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get}
    func start()
}
