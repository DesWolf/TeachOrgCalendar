//
//  Module.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

enum Module {
    case launch
    case login
    case tabBar
    case students
    case editStudent(student: Student?)
    case student(student: Student)
    case calendar
    case editEvent(event: Event?)
    case profile
}
