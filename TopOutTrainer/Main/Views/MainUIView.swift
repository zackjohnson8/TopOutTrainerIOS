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

class MainUIView: UIStackView
{

    var mainViewModel: MainViewModel!
    weak var delegate: MainUIViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
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
