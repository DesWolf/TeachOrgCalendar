//
//  TimeInterval+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/7/21.
//

import Foundation

enum DateFormats {
    static let eventDateShort = "HH:mm dd.MM.yy"
    static let eventTimeShort = "HH:mm"
    static let titleDate = "EEEE, d MMMM yyyy"
}

extension TimeInterval {
    func eventDateShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.eventDateShort

        let date = Date(timeIntervalSince1970: self)
        let formattedDate = dateFormatter.string(from: date)

        return formattedDate
    }
    
    func eventTimeShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.eventTimeShort

        let date = Date(timeIntervalSince1970: self)
        let formattedDate = dateFormatter.string(from: date)

        return formattedDate
    }

    func dateToTitleStr(timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.titleDate
        dateFormatter.locale = Locale(identifier: "RU_RU")
        let str = dateFormatter.string(from: date)
        return str
    }
    
    
}
