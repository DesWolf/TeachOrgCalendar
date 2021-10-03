//
//  StudentsAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Swinject

private let storyboardName = "Students"

struct StudentsAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(StudentsViewController.self) { r, c in
            guard let presenter = r.resolve(StudentsPresenterProtocol.self) else {
                fatalError("Can't resolve StudentsPresenterType in Students View Controller")
            }
            
            c.presenter = presenter
            presenter.view = c
        }
        
        container.register(StudentsPresenterProtocol.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in Students Presenter")
            }
            
            guard let databaseManager = r.resolve(DatabaseManager.self) else {
                fatalError("Can't resolve DatabaseManager in Students Presenter")
            }
            
            guard let databaseNotifier = r.resolve(DatabaseObserver.self) else {
                fatalError("Can't resolve DatabaseNotifier in Students Presenter")
            }
            
            return StudentsPresenter(moduleAssembly: moduleAssembly,
                                     databaseManager: databaseManager,
                                     databaseNotifier: databaseNotifier)
        }
    }
}

