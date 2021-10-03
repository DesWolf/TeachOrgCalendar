//
//  Date+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/13/21.
//

import Foundation

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        return dateFormatter.string(from: self)
    }

    var timeIntervalTimeZone: TimeInterval {
        return TimeInterval(TimeZone.current.secondsFromGMT())
    }

    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
}
