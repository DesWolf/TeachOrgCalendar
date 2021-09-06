//
//  EditEventRow.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/25/21.
//

import UIKit

enum EditEventRow: Equatable {
    case name
    case place
    case studentInfo
    case time
    case repeatedly
    case reminderAndPrice
    case note
    
    var cellIdentifier: String {
        switch self {
        case .name, .place, .repeatedly:
            return TableCellWithTextField.reuseIdentifier
        case .studentInfo, .time:
            return TableCellWithStackView.reuseIdentifier
        case .reminderAndPrice:
            return EditEventReminderAndPriceTableCell.reuseIdentifier
        case .note:
            return EditEventNoteTableCell.reuseIdentifier
        }
    }
}
