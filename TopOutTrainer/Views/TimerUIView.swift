//
//  TimerUIView.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/10/21.
//

import UIKit

class TimerUIView: UIView
{
    var parent: TimerViewController!
    
    var timerOn = false
    var timer = Timer()
    
    var timeLabel: UILabel!
    var playPauseButton: PlayPauseUIButton!
    var resetButton: UIButton!
    
    private var widthAnchor_m: NSLayoutConstraint!
    
    required init(parent: TimerViewController)
    {
        super.init(frame: CGRect.zero)
        self.parent = parent
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("Fatal error in SelectionUIViewModel")
    }
    
    override func didMoveToWindow()
    {
        super.didMoveToWindow()
        self.backgroundColor = .primaryColor()
        
        setConstraints()
        setUI()
    }
}

private extension TimerUIView
{
    private func setUI()
    {
        // Needs:
        //  * Play/Pause button
        //  * Reset button
        //  * Label for timer
        //  * Extra info: I've read that it's much better to use an existing library for timer.
        
        
        // LABEL
        timeLabel = UILabel()
        timeLabel.backgroundColor = .blue
        timeLabel.text = "00:00:00.0"
        timeLabel.font = timeLabel.font.withSize(100)
        timeLabel.textAlignment = .center
        timeLabel.numberOfLines = 1
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.minimumScaleFactor = 0.5
        self.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true

        
        // Play/Pause Button
        // Style will be round with just a symbol to represent play or pause
        let buttonWidth: CGFloat = self.bounds.size.width * 0.2
        let buttonHeight: CGFloat = self.bounds.size.width * 0.2
        playPauseButton = PlayPauseUIButton(width: buttonWidth, height: buttonHeight)
        self.addSubview(playPauseButton)
        playPauseButton.setConstraints()
        
        self.setNeedsLayout()
    }
    
    private func setConstraints()
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        widthAnchor_m = self.widthAnchor.constraint(equalTo: parent.view.widthAnchor, constant: 5)
        widthAnchor_m.isActive = true
        self.heightAnchor.constraint(equalTo: parent.view.heightAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: parent.view.topAnchor, constant: 0).isActive = true
        self.centerXAnchor.constraint(equalTo: parent.view.centerXAnchor).isActive = true
        self.layoutIfNeeded()
    }
}
