//
//  StudentProfileAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import Swinject

struct EditStudentAssembly: Assembly {
    func assemble(container: Container) {
        container.register(EditStudentPresenterProtocol.self) { (r, student: Student?) in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in EditStudent Presenter")
            }
            
            guard let databaseManager = r.resolve(DatabaseManager.self) else {
                fatalError("Can't resolve DatabaseManager in EditStudent Presenter")
            }
            
            return EditStudentPresenter(moduleAssembly: moduleAssembly,
                                           databaseManager: databaseManager,
                                           student: student)
        }
        
        container.register(EditStudentViewProtocol.self) { (r, student: Student?) in
            let viewController = EditStudentViewController()
            
            guard var presenter = r.resolve(EditStudentPresenterProtocol.self, argument: student) else {
                fatalError("Can't resolve EditStudentPresenterProtocol in AddStudent View Controller")
            }
            
            presenter.view = viewController
            viewController.presenter = presenter
            return viewController
        }
    }
}
