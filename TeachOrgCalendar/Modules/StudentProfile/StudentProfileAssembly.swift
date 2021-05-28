//
//  StudentProfileAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import Swinject

struct StudentProfileAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StudentProfilePresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in StudentProfile Presenter")
            }
            
            return StudentProfilePresenter(moduleAssembly: moduleAssembly)
        }
        
        container.register(StudentProfileViewControllerType.self) { r in
            let viewController = StudentProfileViewController()
            
            guard let presenter = r.resolve(StudentProfilePresenterType.self) else {
                fatalError("Can't resolve StudentProfilePresenterType in Login View Controller")
            }
            
            viewController.presenter = presenter
            return viewController
        }
    }
}
