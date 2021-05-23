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
        container.register(ModuleAssemblyType.self) { r in ModuleAssembly(resolver: r) }.inObjectScope(.container)
        
//        container.register(MainPageData.self) { _ in MainPageData() }.inObjectScope(.container)
    }
}
