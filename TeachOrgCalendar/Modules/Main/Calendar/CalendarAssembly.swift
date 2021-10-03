//
//  SecondTabAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Swinject

private let storyboardName = "Calendar"

struct CalendarAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(CalendarViewController.self) { r, c in
            guard var presenter = r.resolve(CalendarPresenterProtocol.self) else {
                fatalError("Can't resolve CalendarPresenterType in Calendar View Controller")
            }
            
            c.presenter = presenter
            presenter.view = c
        }
        
        container.register(CalendarPresenterProtocol.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in Calendar Presenter")
            }
            
            guard let databaseManager = r.resolve(DatabaseManager.self) else {
                fatalError("Can't resolve DatabaseManager in Calendar Presenter")
            }
            
            guard let databaseNotifier = r.resolve(DatabaseObserver.self) else {
                fatalError("Can't resolve DatabaseNotifier in Calendar Presenter")
            }
            
            return CalendarPresenter(moduleAssembly: moduleAssembly,
                                     databaseManager: databaseManager,
                                     databaseNotifier: databaseNotifier)
        }
    }
}
