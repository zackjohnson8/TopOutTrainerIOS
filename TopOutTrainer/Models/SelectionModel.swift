//
//  SelectionModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/14/21.
//

import Foundation
import UIKit

struct NavigationBar
{
    
}

class SelectionViewModel
{
    var rightBarItem: UIBarButtonItem!
    var selectionViews: [UIView] = []
    var selectionViewColors: [UIColor] = [UIColor.green, UIColor.blue, UIColor.orange, UIColor.systemPink]
    var title: String!
    
    init(_ parent: UIViewController)
    {
        createRightBarItem()
        createSelectionViews(parent)
    }
    
    private func createSelectionViews(_ parent: UIViewController)
    {
        var selection: UIView!
        for index in 0...(selectionViewColors.count - 1)
        {
            selection = SelectionUIView(parent: parent, bgColor: selectionViewColors[index])
            selectionViews.append(selection as UIView)
        }
    }
    
    private func createRightBarItem()
    {
        let userImage = UIImage(systemName: "person.crop.circle")
        rightBarItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        rightBarItem.tintColor = .systemBlue
        title = "Topout Trainer"
    }
    
    @objc private func tappedRightBarButton()
    {
        // Add a dropdown menu of account options
        print("Right NavBar User Icon Clicked")
    }
}
