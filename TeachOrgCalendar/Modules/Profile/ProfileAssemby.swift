//
//  ProfileAssemby.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Swinject

private let storyboardName = "Profile"

struct ProfileAssembly: Assembly {
    func assemble(container: Container) {
        
        container.storyboardInitCompleted(ProfileViewController.self) { r, c in
            guard var presenter = r.resolve(ProfilePresenterType.self) else {
                fatalError("Can't resolve ProfilePresenterType in Profile View Controller")
            }
            
            c.presenter = presenter
            presenter.viewController = c
        }
        
        container.register(ProfilePresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Profile Presenter")
            }
            
            return ProfilePresenter(moduleAssembly: moduleAssembly)
        }
    }
}
