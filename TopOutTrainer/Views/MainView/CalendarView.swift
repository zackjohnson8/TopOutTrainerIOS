//
//  Calendar.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 8/1/21.
//

import Foundation
import UIKit

protocol CalendarViewDelegate: AnyObject
{

}

class CalendarView: UIView
{
    var constraints_m: [NSLayoutConstraint]?
    
    weak var delegate: CalendarViewDelegate?
    
    required override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = .secondaryColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error: CalendarView init encountered fatal error")
    }
    
    deinit {
        print("Deinitialized the CalendarView")
    }
}
