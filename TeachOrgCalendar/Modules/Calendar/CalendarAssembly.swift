//
//  SecondTabAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Swinject

struct CalendarAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContactsPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Contacts Presenter")
            }
            
            return ContactsPresenter(moduleAssembly: moduleAssembly)
        }
        
        container.register(ContactsViewControllerType.self) { r in
            let viewController = ContactsViewController()
            
            guard let presenter = r.resolve(ContactsPresenterType.self) else {
                fatalError("Can't resolve LoginPresenterType in Contacts View Controller")
            }
            
            viewController.presenter = presenter
            return viewController
        }
    }
}
