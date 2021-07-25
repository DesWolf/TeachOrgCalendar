//
//  FirstPageAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Swinject

struct LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginPresenterProtocol.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in Login Presenter")
            }
            
            return LoginPresenter(moduleAssembly: moduleAssembly)
        }
        
        container.register(LoginViewProtocol.self) { r in
            let viewController = LoginViewController()
            
            guard let presenter = r.resolve(LoginPresenterProtocol.self) else {
                fatalError("Can't resolve LoginPresenterType in Login View Controller")
            }
            
            guard let appCoordinator = r.resolve(AppCoordinatorProtocol.self) else {
                fatalError("Can't resolve UserManager in Login View Controller")
            }
            
            guard let authManager = r.resolve(AuthManager.self) else {
                fatalError("Can't resolve AuthManager in Login Presenter")
            }
            
            guard let authNotifier = r.resolve(AuthObserver.self) else {
                fatalError("Can't resolve AuthNotifier in Login View Controller")
            }
            
            viewController.presenter = presenter
            viewController.appCoordinator = appCoordinator
            viewController.authManager = authManager
            viewController.authNotifier = authNotifier
            
            return viewController
        }
    }
}
