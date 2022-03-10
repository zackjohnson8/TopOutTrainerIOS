//
//  MainUIViewModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/17/21.
//

import UIKit

protocol MainUIViewDelegate: AnyObject
{
    func addedMainUIViewToWindow()
}

class MainUIView: UIView
{

    var mainViewModel: MainViewModel!
    weak var delegate: MainUIViewDelegate?

    var constraints_m: [NSLayoutConstraint]?

    required override init(frame: CGRect)
    {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("Error: MainUIView init fatal error")
    }

    deinit {
        print("MainUIView deinit")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        delegate?.addedMainUIViewToWindow()
    }

    private func initialize() {
        mainViewModel = MainViewModel()
        mainViewModel.delegate = self

        self.backgroundColor = .secondaryColor()
    }
    
}

extension MainUIView: MainViewModelDelegate {

}
