//
//  StatsModel.swift
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

protocol StatsViewModelDelegate: AnyObject {
    func onStatsButtonPressed(buttonType: ButtonType)
}

class StatsViewModel
{
    var rightBarItem: UIBarButtonItem!
    var statsView: StatsUIView! // Holds the Stats Buttons
    var title: String!
    
    weak var delegate: StatsViewModelDelegate?
    
    init(_ parent: StatsViewController)
    {
        createRightBarItem()
        createStatsView(parent)
    }
    
    private func createStatsView(_ parent: StatsViewController)
    {
        statsView = StatsUIView(parent: parent)
        statsView.delegate = self
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

extension StatsViewModel: StatsUIViewDelegate
{
    func onTimerButtonPressed() {
        self.delegate?.onStatsButtonPressed(buttonType: ButtonType.timer)
    }
    
    func onWeightsButtonPressed() {
        self.delegate?.onStatsButtonPressed(buttonType: ButtonType.weights)
    }
    
    func onStatsButtonPressed() {
        self.delegate?.onStatsButtonPressed(buttonType: ButtonType.stats)
    }
    
    func onCalendarButtonPressed() {
        self.delegate?.onStatsButtonPressed(buttonType: ButtonType.calendar)
    }
    
    
}
