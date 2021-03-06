//
//  ServiceAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation
import Swinject

struct ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ModuleAssembly.self) { r in ModuleAssemblyImpl(resolver: r) }.inObjectScope(.container)
    }
}
