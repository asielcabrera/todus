//
//  DateHelper.swift
//  todus
//
//  Created by Wilder Lopez on 8/31/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation

class DateHelper{
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        //        formatter.doesRelativeDateFormatting = true
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    ///Return short Time : 9:51 am
    static func getDateWith(timeInterval : Int64) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    //Return Custom Time
    static func getPrettyDateWith(timeInterval: Int64, dateFormat: String = "d MMM", dateStyle: DateFormatter.Style = .none , timeStyle : DateFormatter.Style = .none, relativeDate: Bool = false) -> String{
        
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
        let dateFormatter = DateFormatter()
        
        
        
        if Calendar.current.isDateInToday(date) || Calendar.current.isDateInYesterday(date){
            dateFormatter.doesRelativeDateFormatting = true
            dateFormatter.dateStyle = .short
        }else {
            dateFormatter.dateFormat = dateFormat
            dateFormatter.doesRelativeDateFormatting = relativeDate
            if dateStyle == .none {
                dateFormatter.dateStyle = dateStyle
            }
            if timeStyle == .none {
                dateFormatter.timeStyle = timeStyle
            }
        }
        
        return dateFormatter.string(from: date)
    }
    
    static func getDateWith(timeInterval : Int64) -> Date {
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
        return date
    }
}
