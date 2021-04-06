//
//  Router.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 4/5/21.
//

import Foundation
import UIKit

public protocol Router: class {
    
    func present(_ viewController: UIViewController, animated: Bool)
    
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?)
    
    func dismiss(animated: Bool)
    
    // If you do end up needing a function for dismissing an individual viewController than create one
}

extension Router {
    
    public func present(_ viewController: UIViewController, animated: Bool) {
        
        present(viewController, animated: animated, onDismissed: nil)
    }
}
