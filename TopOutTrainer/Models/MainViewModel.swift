//
//  MainModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/14/21.
//

import Foundation
import UIKit

public enum ButtonType {
    case timer,
         weights,
         stats,
         calendar
}

protocol MainViewModelDelegate: AnyObject {
    func onMainButtonPressed(buttonType: ButtonType)
}

class MainViewModel
{
    var rightBarItem: UIBarButtonItem!
    var mainView: MainUIView! // Holds the Main Buttons
    var title: String!
    var parent: MainViewController!
    
    weak var delegate: MainViewModelDelegate?
    
    init(_ parent: MainViewController)
    {
        self.parent = parent
        
        createRightBarItem()
        createMainView(parent)
    }
    
    private func createMainView(_ parent: MainViewController)
    {
        mainView = MainUIView(frame: .zero)
        mainView.delegate = self
    }
    
    private func createRightBarItem()
    {
        let userImage = UIImage(systemName: "person.crop.circle")
        rightBarItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        rightBarItem.tintColor = .systemBlue
    }
    
    @objc private func tappedRightBarButton()
    {
        // Add a dropdown menu of account options
        print("Right NavBar User Icon Clicked")
    }
}

extension MainViewModel: MainUIViewDelegate
{
    func addedToWindow() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.widthAnchor.constraint(equalTo: parent.view.widthAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor).isActive = true
    }
}
