//
//  CalendarCell.swift
//  CalendarCell
//
//  Created by Furkan Torun on 20.09.2018.
//  Copyright © 2018 Furkan Torun. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar
import Eureka



public class CalendarCell: Cell<Set<Date>>, CellType,FSCalendarDelegate,FSCalendarDataSource {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var lblSelectedDates: UILabel!
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    open override func setup() {
        height = { 400 }
        row.title = nil
        super.setup()
        selectionStyle = .none
        calendar.allowsMultipleSelection = true
        
calendar.clipsToBounds = true
        
        calendar.delegate = self
    }
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        labelUpdate()
    }
    
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        labelUpdate()
    }
    
    public func labelUpdate()
    {
        
        var st:String = ""
        
        for date in calendar.selectedDates {
            st = "\(st)\(self.dateFormatter.string(from: date)), "
        }
        
        lblSelectedDates.text = "Seçili Tarihler : " + st
    }
}


//MARK: WeekDayRow

public final class CalendarRow: Row<CalendarCell>, RowType {
    
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
        cellProvider = CellProvider<CalendarCell>(nibName: "CalendarCell")
    }
}
