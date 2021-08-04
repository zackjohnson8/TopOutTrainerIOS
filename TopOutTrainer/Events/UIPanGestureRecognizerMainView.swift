//
//  UIPanGestureRecognizerMainView.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 8/3/21.
//

import Foundation
import UIKit.UIGestureRecognizerSubclass

class UIPanGestureRecognizerMainView: UIPanGestureRecognizer
{
    public var initialTouchLocation: CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        initialTouchLocation = touches.first!.location(in: view)
    }
}
