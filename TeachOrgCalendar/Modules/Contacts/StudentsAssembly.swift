//
//  ContactsAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Swinject

private let storyboardName = "Contacts"

struct StudentsAssembly: Assembly {
    func assemble(container: Container) {
        
        container.storyboardInitCompleted(StudentsViewController.self) { r, c in
            guard var presenter = r.resolve(StudentsPresenterType.self) else {
                fatalError("Can't resolve ContactsPresenterType in Contacts View Controller")
            }
            
            c.presenter = presenter
            presenter.viewController = c
        }
        
        container.register(StudentsPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Contacts Presenter")
            }
            
            return StudentsPresenter(moduleAssembly: moduleAssembly)
        }
    }
}

