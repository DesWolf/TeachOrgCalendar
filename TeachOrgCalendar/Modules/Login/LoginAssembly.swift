//
//  FirstPageAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Swinject

struct LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Login Presenter")
            }
            
            return LoginPresenter(moduleAssembly: moduleAssembly)
        }
        
        container.register(LoginViewControllerType.self) { r in
            let viewController = LoginViewController()
            
            guard let presenter = r.resolve(LoginPresenterType.self) else {
                fatalError("Can't resolve LoginPresenterType in Login View Controller")
            }
            
            guard let userManager = r.resolve(UserManagerType.self) else {
                fatalError("Can't resolve UserManager in Login View Controller")
            }
            
            viewController.presenter = presenter
            viewController.userManager = userManager
            return viewController
        }
    }
}
