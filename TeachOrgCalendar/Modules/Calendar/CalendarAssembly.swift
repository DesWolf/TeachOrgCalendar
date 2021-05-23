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
            guard var presenter = r.resolve(CalendarPresenterType.self) else {
                fatalError("Can't resolve CalendarPresenterType in Calendar View Controller")
            }
            
            c.presenter = presenter
            presenter.viewController = c
        }
        
        container.register(CalendarPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Calendar Presenter")
            }
            
            return CalendarPresenter(moduleAssembly: moduleAssembly)
        }
    }
}
