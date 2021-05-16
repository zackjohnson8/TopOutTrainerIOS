//
//  CalendarViewModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

class CalendarViewModel
{
    var calendarUIView:CalendarUIView
    
    init(parent: CalendarViewController)
    {
        let calendarView = CalendarUIView(parent: parent)
        self.calendarUIView = calendarView
    }
}
