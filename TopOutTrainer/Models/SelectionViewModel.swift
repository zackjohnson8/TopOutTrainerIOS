//
//  SelectionModel.swift
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

protocol SelectionViewModelDelegate: AnyObject {
    func onSelectionButtonPressed(buttonType: ButtonType)
}

class SelectionViewModel
{
    var rightBarItem: UIBarButtonItem!
    var selectionView: SelectionUIView! // Holds the Selection Buttons
    var title: String!
    
    weak var delegate: SelectionViewModelDelegate?
    
    init(_ parent: SelectionViewController)
    {
        createRightBarItem()
        createSelectionView(parent)
    }
    
    private func createSelectionView(_ parent: SelectionViewController)
    {
        selectionView = SelectionUIView(parent: parent)
        selectionView.delegate = self
    }
    
    private func createRightBarItem()
    {
        let userImage = UIImage(systemName: "person.crop.circle")
        rightBarItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        rightBarItem.tintColor = .systemBlue
        title = "Dashboard"
        
    }
    
    @objc private func tappedRightBarButton()
    {
        // Add a dropdown menu of account options
        print("Right NavBar User Icon Clicked")
    }
}

extension SelectionViewModel: SelectionUIViewDelegate
{
    func onTimerButtonPressed() {
        self.delegate?.onSelectionButtonPressed(buttonType: ButtonType.timer)
    }
    
    func onWeightsButtonPressed() {
        self.delegate?.onSelectionButtonPressed(buttonType: ButtonType.weights)
    }
    
    func onStatsButtonPressed() {
        self.delegate?.onSelectionButtonPressed(buttonType: ButtonType.stats)
    }
    
    func onCalendarButtonPressed() {
        self.delegate?.onSelectionButtonPressed(buttonType: ButtonType.calendar)
    }
    
    
}
