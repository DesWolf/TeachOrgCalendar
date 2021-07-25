//
//  LaunchAssambly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/25/21.
//

import Swinject

struct LaunchAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LaunchPresenterProtocol.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in Login Presenter")
            }
            
            return LaunchPresenter(moduleAssembly: moduleAssembly)
        }
        
        container.register(LaunchViewProtocol.self) { r in
            let viewController = LaunchViewController()
            
            guard let presenter = r.resolve(LaunchPresenterProtocol.self) else {
                fatalError("Can't resolve LoginPresenterType in Login View Controller")
            }
            
            guard let authManager = r.resolve(AuthManager.self) else {
                fatalError("Can't resolve AuthManager in Login Presenter")
            }
            
            guard let appCoordinator = r.resolve(AppCoordinatorProtocol.self) else {
                fatalError("Can't resolve UserManager in Login View Controller")
            }
            
            viewController.presenter = presenter
            viewController.authManager = authManager
            viewController.appCoordinator = appCoordinator

            
            return viewController
        }
    }
}
