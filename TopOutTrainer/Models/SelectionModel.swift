//
//  SelectionModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/14/21.
//

import Foundation
import UIKit

class SelectionViewModel
{
    var rightBarItem: UIBarButtonItem!
    var selectionView: SelectionUIView!
    var title: String!
    
    init(_ parent: UIViewController)
    {
        createRightBarItem()
        createSelectionView(parent)
    }
    
    private func createSelectionView(_ parent: UIViewController)
    {
        selectionView = SelectionUIView(parent: parent)
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
