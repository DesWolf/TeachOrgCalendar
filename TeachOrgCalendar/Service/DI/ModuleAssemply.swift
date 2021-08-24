//
//  ModuleAssemply.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

protocol ModuleAssembly {
    func assembledView(for: Module) throws -> UIViewController
}

class ModuleAssemblyImpl {
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    private func resolveView<T>(for type: T.Type) throws -> UIViewController {
        guard let controller = resolver.resolve(type) as? UIViewController else {
            throw ModuleAssemblyError.dependencyResolvingError
        }
        return controller
    }
}

extension ModuleAssemblyImpl: ModuleAssembly {
    func assembledView(for module: Module) throws -> UIViewController {
        switch module {
        case .launch:
            return try resolveView(for: LaunchViewProtocol.self)
        case .login:
            return try resolveView(for: LoginViewProtocol.self)
        case .tabBar:
            return try resolveView(for: TabBarViewProtocol.self)
        case .students:
            return try resolveView(for: StudentsViewProtocol.self)
        case .calendar:
            return try resolveView(for: CalendarViewProtocol.self)
        case .profile:
            return try resolveView(for: ProfileViewProtocol.self)
        case .editStudent(let student):
            guard let addOrEditStudent = resolver.resolve(EditStudentProtocol.self, argument: student) as? UIViewController else {
                throw ModuleAssemblyError.dependencyResolvingError
            }
            return addOrEditStudent
        case .student(let student):
            guard let studentProfile = resolver.resolve(StudentViewProtocol.self, argument: student) as? UIViewController else {
                throw ModuleAssemblyError.dependencyResolvingError
            }
            return studentProfile
        }
    }
}
