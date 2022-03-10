//
//  MainViewController.swift
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

protocol MainViewControllerDelegate: AnyObject {
    func mainButtonPressed(event: Event)
}

final class MainViewController: UIViewController
{
    var navigationSettings: MainNavigationBar!
    var mainView: MainUIView!
    
    weak var delegate: MainViewControllerDelegate?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.navigationSettings = MainNavigationBar(title: "MainViewController", rightBarButtonItem: MainNavigationRightBarButtonItem())
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    private func initialize() {

        self.view.layoutIfNeeded()
        self.view.backgroundColor = .primaryColor()

        // Get mainView from mainModel and add it to the subviews
        mainView = MainUIView()
        self.view.addSubview(mainView)
    }

}


