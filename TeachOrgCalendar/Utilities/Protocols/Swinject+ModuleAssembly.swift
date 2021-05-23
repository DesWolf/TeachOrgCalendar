//
//  Swinject+ModuleAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 12/18/20.
//

import Swinject

extension Assembly {
    func moduleAssembly(_ r: Resolver) -> ModuleAssemblyType {
        guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
            fatalError("Failed to resolve module assembly")
        }
        return moduleAssembly
    }
}
