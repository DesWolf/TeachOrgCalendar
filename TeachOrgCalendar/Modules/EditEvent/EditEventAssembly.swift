//
//  EditEventAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/24/21.
//

import Swinject

struct EditEventAssembly: Assembly {
    func assemble(container: Container) {
        container.register(EditEventPresenterProtocol.self) { (r, event: Event?) in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in EditEvent Presenter")
            }
            
            guard let databaseManager = r.resolve(DatabaseManager.self) else {
                fatalError("Can't resolve DatabaseManager in EditEvent Presenter")
            }
            
            return EditEventPresenter(moduleAssembly: moduleAssembly,
                                           databaseManager: databaseManager,
                                           event: event)
        }
        
        container.register(EditEventViewProtocol.self) { (r, event: Event?) in
            let viewController = EditEventViewController()
            
            guard var presenter = r.resolve(EditEventPresenterProtocol.self, argument: event) else {
                fatalError("Can't resolve EditEventPresenterProtocol in EditEvent View Controller")
            }
            
            presenter.view = viewController
            viewController.presenter = presenter
            return viewController
        }
    }
}
