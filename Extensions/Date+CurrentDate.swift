//
//  Date+CurrentDate.swift
//  Qrs Walut
//
//  Created by Radosław Tarnawski on 1/29/21.
//

import Foundation

extension Date {
    
    static var currentDate: String {
        self.getFormatedDate(Date())
    }
    
    static var lastWeekMondayDate: String {
        var date = Calendar.iso8601.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: Date() - 7).date!
        date.addTimeInterval(-60*60*24*7)
        return self.getFormatedDate(date)
    }
    
    static func dayOfWeek(_ date: Date) -> String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date).capitalized
        }
    
    static func convertStringToDate (_ strDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: strDate)
    }
    
    private static func getFormatedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    

}
