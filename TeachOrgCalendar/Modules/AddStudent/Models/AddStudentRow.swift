//
//  StudentProfileModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

enum AddStudentRow: Equatable {
    case name
    case discipline
    case phone
    case email
    case note
    
    var cellIdentifier: String {
        switch self {
        case .name:
            return NameTableCell.reuseIdentifier
        case .discipline:
            return DisciplineTableCell.reuseIdentifier
        case .phone:
            return ContactsTableCell.reuseIdentifier
        case .email:
            return ContactsTableCell.reuseIdentifier
        case .note:
            return NoteTableCell.reuseIdentifier
        }
    }
}
