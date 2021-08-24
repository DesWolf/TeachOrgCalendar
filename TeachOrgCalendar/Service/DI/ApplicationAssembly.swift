//
//  ApplicationAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation
import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {

    // default dependencies
    static let assembler = Assembler(
        [
            LoginAssembly(),
            TabBarAssembly(),
            StudentsAssembly(),
            StudentAssembly(),
            EditStudentAssembly(),
            CalendarAssembly(),
            ProfileAssembly(),
            ServiceAssembly(),
            ManagerAssembly(),
            NotifiersAssembly(),
            LaunchAssembly()
        ]
    )
}
