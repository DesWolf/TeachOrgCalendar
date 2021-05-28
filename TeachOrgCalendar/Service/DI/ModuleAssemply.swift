//
//  ModuleAssemply.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

protocol ModuleAssemblyType {
    func assembledView(for: Module) throws -> UIViewController
}

class ModuleAssembly {
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

extension ModuleAssembly: ModuleAssemblyType {
    
    func assembledView(for module: Module) throws -> UIViewController {
        switch module {
        case .login:
            return try resolveView(for: LoginViewControllerType.self)
        case .tabBar:
            return try resolveView(for: TabBarViewControllerType.self)
        case .students:
            return try resolveView(for: StudentsViewControllerType.self)
        case .calendar:
            return try resolveView(for: CalendarViewControllerType.self)
        case .profile:
            return try resolveView(for: ProfileViewControllerType.self)
        }
    }
}
