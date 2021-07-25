//
//  ManagerAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation
import Swinject

struct ManagerAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(AppNavigatorType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Failed to resolve module assembly for App navigator")
            }
            return AppNavigator(moduleAssembly: moduleAssembly)
        }
        
        // MARK: - User manager
        container.register(AppCoordinatorProtocol.self) { r in
            
            guard let appNavigator = r.resolve(AppNavigatorType.self) else {
                fatalError("Can't resolve App navigator for User manager")
            }
            let userManager = AppCoordinator(appNavigator: appNavigator)
            
            return userManager
        }.inObjectScope(.container)
        
        
        // MARK: - Auth manager
        container.register(AuthManager.self) { r in
            guard let authNotifier = r.resolve(AuthNotifierImpl.self) else {
                fatalError("Can't resolve Auth Notifier for Auth manager")
            }
            let authManager = AuthManagerImpl(authNotifier: authNotifier)
            
            return authManager
            
        }.inObjectScope(.container)
    }
}
