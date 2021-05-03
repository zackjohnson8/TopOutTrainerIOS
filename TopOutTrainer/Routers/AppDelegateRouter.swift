//
//  AppDelegateRouter.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 4/5/21.
//

import Foundation
import UIKit

public class AppDelegateRouter: Router {
    
    public let window: UIWindow
    
    public init(window: UIWindow)
    {
        self.window = window
    }
    
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?)
    {
        window.rootViewController = viewController // New copy of the SelectionViewController is submitted to the rootViewController
        window.makeKeyAndVisible()
    }
    
    public func dismiss(animated: Bool)
    {
        // doing nothing because the AppDelegate will be holding onto this and won't be dismissing
    }
}
