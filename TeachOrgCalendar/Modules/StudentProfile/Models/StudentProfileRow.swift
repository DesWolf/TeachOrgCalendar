//
//  StudentProfileRow.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import Foundation

enum StudentProfileRow: Equatable {
    case name
    case discipline
    case phone
    case email
    case note
    
    var cellIdentifier: String {
        switch self {
        case .name:
            return EditNameTableCell.reuseIdentifier
        case .discipline:
            return EditDisciplineTableCell.reuseIdentifier
        case .phone:
            return EditContactsTableCell.reuseIdentifier
        case .email:
            return EditContactsTableCell.reuseIdentifier
        case .note:
            return EditNoteTableCell.reuseIdentifier
        }
    }
}
