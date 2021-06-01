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
    var timeDisplayed = 0.0
    
    var timeLabel: UILabel!
    var playPauseButton: PlayPauseUIButton!
    var resetTimerButton: ResetTimerUIButton!
    var resetButton: UIButton!
    
    var playButtonPressed: Bool = false
    var resetButtonPressed: Bool = false
    
    @IBOutlet weak var playButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var playButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var resetButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var resetButtonHeightConstraint: NSLayoutConstraint!

    
    required init(parent: TimerViewController)
    {
        super.init(frame: CGRect.zero)
        self.parent = parent
        
        
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("Fatal error in MainUIViewModel")
    }
    
    override func didMoveToWindow()
    {
        super.didMoveToWindow()
        self.backgroundColor = .primaryColor()
        
        setViewConstraints()
        setUI()
    }
}

private extension TimerUIView
{
    private func setUI()
    {
        setTimeLabel()
        setPlayButton()
        setResetButton()
        
        self.setNeedsLayout()
    }
    
    private func setViewConstraints()
    {
        translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: parent.view.widthAnchor, constant: 5).isActive = true
        self.heightAnchor.constraint(equalTo: parent.view.heightAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: parent.view.topAnchor, constant: 0).isActive = true
        self.centerXAnchor.constraint(equalTo: parent.view.centerXAnchor).isActive = true
        
        self.layoutIfNeeded()
    }
    
    private func setTimeLabel()
    {
        timeLabel = {
            let label = UILabel(frame: CGRect.init(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height * 0.25))
            label.backgroundColor = .primaryColor()
            label.font = label.font.withSize(self.bounds.size.width * 0.217)
            label.numberOfLines = 1
            return label
        }()
        self.printTimeToLabel()
        
        self.addSubview(timeLabel)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    private func setPlayButton()
    {
        let buttonWidth: CGFloat = self.bounds.size.width * 0.2
        let buttonHeight: CGFloat = self.bounds.size.width * 0.2
        
        let buttonXConstant: CGFloat = -(self.bounds.size.width * 0.2)
        
        playPauseButton = PlayPauseUIButton(width: buttonWidth, height: buttonHeight)
        playPauseButton.addTarget(self, action: #selector(self.playButtonClicked), for: .touchDown)
        playPauseButton.addTarget(self, action: #selector(self.playButtonReleased), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(self.playButtonCancel), for: .touchDragOutside)
        self.addSubview(playPauseButton)
        
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        playButtonWidthConstraint = playPauseButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        playButtonHeightConstraint = playPauseButton.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        playButtonWidthConstraint.isActive = true
        playButtonHeightConstraint.isActive = true
        playPauseButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 25).isActive = true
        playPauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: buttonXConstant).isActive = true
    }
    
    private func setResetButton()
    {
        let buttonWidth: CGFloat = self.bounds.size.width * 0.2
        let buttonHeight: CGFloat = self.bounds.size.width * 0.2
        
        let buttonXConstant: CGFloat = self.bounds.size.width * 0.2

        resetTimerButton = ResetTimerUIButton(width: buttonWidth, height: buttonHeight)
        resetTimerButton.addTarget(self, action: #selector(self.resetButtonClicked), for: .touchDown)
        resetTimerButton.addTarget(self, action: #selector(self.resetButtonReleased), for: .touchUpInside)
        resetTimerButton.addTarget(self, action: #selector(self.resetButtonCancel), for: .touchDragOutside)
        self.addSubview(resetTimerButton)
        
        resetTimerButton.translatesAutoresizingMaskIntoConstraints = false
        resetButtonWidthConstraint = resetTimerButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        resetButtonHeightConstraint = resetTimerButton.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        resetButtonWidthConstraint.isActive = true
        resetButtonHeightConstraint.isActive = true
        resetTimerButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 25).isActive = true
        resetTimerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: buttonXConstant).isActive = true
    }
    
    private func printTimeToLabel()
    {
        
        var timeRemaining: Int = Int(timeDisplayed)
        
        let milliseconds = Int(timeDisplayed.truncatingRemainder(dividingBy: 1) * 100)
        let seconds = timeRemaining % 60
        timeRemaining = timeRemaining / 60
        let minutes = timeRemaining % 60
        timeRemaining = timeRemaining / 60
        let hours = timeRemaining
        
        // 00:00:00.00
        var millisecondsString = String(milliseconds)
        var secondsString = String(seconds)
        var minutesString = String(minutes)
        var hoursString = String(hours)
        
        millisecondsString.count == 1 ? millisecondsString = "0\(millisecondsString)": ()
        secondsString.count == 1 ? secondsString = "0\(secondsString)": ()
        minutesString.count == 1 ? minutesString = "0\(minutesString)": ()
        hoursString.count == 1 ? hoursString = "0\(hoursString)": ()
        
        let stringTime: String?
        if(hours < 1)
        {
            stringTime = "\(minutesString):\(secondsString).\(millisecondsString)"
        }else
        {
            stringTime = "\(hoursString):\(minutesString):\(secondsString)"
        }

        timeLabel.text = stringTime
        
    }
    
    @objc func playButtonClicked(_ sender: Any)
    {
        playButtonPressed = true
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.playButtonWidthConstraint.constant -= 10
                        self.playButtonHeightConstraint.constant -= 10
                        self.playPauseButton.layer.cornerRadius = (self.playPauseButton.width_m - 10) * 0.5
                        self.playPauseButton.buttonPressedDown()
                        self.layoutIfNeeded()
                       }
        )
    }
    
    @objc func playButtonReleased(_ sender: Any)
    {
        if(timerOn)
        {
            timer.invalidate()
            playPauseButton.setBackgroundImage(.PLAY)
        }else
        {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.startTimer), userInfo: nil, repeats: true)
            playPauseButton.setBackgroundImage(.PAUSE)
        }
        timerOn = !timerOn
        
        playButtonPressed = false
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.playButtonWidthConstraint.constant += 10
                        self.playButtonHeightConstraint.constant += 10
                        self.playPauseButton.buttonReleased()
                        self.layoutIfNeeded()
                       }
        )
    }
    
    @objc func playButtonCancel(_ sender: Any)
    {
        if(playButtonPressed)
        {
            playButtonPressed = false
            UIView.animate(withDuration: 0.1,
                           animations: {
                            self.playButtonWidthConstraint.constant += 10
                            self.playButtonHeightConstraint.constant += 10
                            self.playPauseButton.buttonCancel()
                            self.layoutIfNeeded()
                           }
            )
        }
    }
    
    @objc func resetButtonClicked(_ sender: Any)
    {
        resetButtonPressed = true
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.resetButtonWidthConstraint.constant -= 10
                        self.resetButtonHeightConstraint.constant -= 10
                        self.resetTimerButton.layer.cornerRadius = (self.resetTimerButton.width_m - 10) * 0.5
                        self.resetTimerButton.buttonPressedDown()
                        self.layoutIfNeeded()
                       }
        )
    }
    
    @objc func resetButtonReleased(_ sender: Any)
    {
        timeDisplayed = 0.0
        self.printTimeToLabel()
        resetButtonPressed = false
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.resetButtonWidthConstraint.constant += 10
                        self.resetButtonHeightConstraint.constant += 10
                        self.resetTimerButton.buttonReleased()
                        self.layoutIfNeeded()
                       }
        )
    }
    
    @objc func resetButtonCancel(_ sender: Any)
    {
        if(resetButtonPressed)
        {
            resetButtonPressed = false
            UIView.animate(withDuration: 0.1,
                           animations: {
                            self.resetButtonWidthConstraint.constant += 10
                            self.resetButtonHeightConstraint.constant += 10
                            self.resetTimerButton.buttonCancel()
                            self.layoutIfNeeded()
                           }
            )
        }
    }
    
    @objc func startTimer(){
        timeDisplayed += 0.01
        self.printTimeToLabel()
        
        self.layoutIfNeeded()
    }
}
