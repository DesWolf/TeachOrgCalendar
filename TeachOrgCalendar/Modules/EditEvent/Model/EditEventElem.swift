//
//  EditEventElem.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/29/21.
//

import Foundation

enum EditEventElemType: Equatable {
    case name
    case place
    case student
    case discipline
    case repeatedly
    case startEvent
    case endEvent
    case reminder
    case price
    case note
}

struct EditEventElem {
    let title: String
    let text: String?
    let type: EditEventElemType
}
