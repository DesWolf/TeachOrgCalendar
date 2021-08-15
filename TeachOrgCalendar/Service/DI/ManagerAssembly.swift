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
        
        container.register(AppNavigator.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Failed to resolve module assembly for App navigator")
            }
            return AppNavigatorImpl(moduleAssembly: moduleAssembly)
        }
        
        // MARK: - User manager
        container.register(AppCoordinatorProtocol.self) { r in
            
            guard let appNavigator = r.resolve(AppNavigator.self) else {
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
        
        // MARK: - Database manager
        container.register(DatabaseManager.self) { r in
            guard let authManager = r.resolve(AuthManager.self) else {
                fatalError("Can't resolve Auth Manager for Database manager")
            }
            
            guard let databaseNotifier = r.resolve(DatabaseNotifier.self) else {
                fatalError("Can't resolve Auth Manager for Database manager")
            }
            
            
            let databaseManager = DatabaseManagerImpl(authManager: authManager,
                                                      databaseNotifier: databaseNotifier)
            
            return databaseManager
        
        }.inObjectScope(.container)

    }
}
