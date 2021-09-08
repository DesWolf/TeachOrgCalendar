//
//  TimeInterval+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/7/21.
//

import Foundation

enum DateFormats {
    static let eventDateShort = "HH:MM dd.MM.YY"
}

extension TimeInterval {
    func eventDateShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.eventDateShort

        let date = Date(timeIntervalSince1970: self)
        let formattedDate = dateFormatter.string(from: date)

        return formattedDate
    }
    
    
}
