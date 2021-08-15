//
//  StudentProfileAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import Swinject

struct AddStudentAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AddStudentPresenterProtocol.self) { (r, student: Student?) in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in AddStudent Presenter")
            }
            
            guard let databaseManager = r.resolve(DatabaseManager.self) else {
                fatalError("Can't resolve DatabaseManager in AddStudent Presenter")
            }
            
            return AddStudentPresenter(moduleAssembly: moduleAssembly,
                                           databaseManager: databaseManager,
                                           student: student)
        }
        
        container.register(AddStudentProtocol.self) { (r, student: Student?) in
            let viewController = AddStudentViewController()
            
            guard let presenter = r.resolve(AddStudentPresenterProtocol.self, argument: student) else {
                fatalError("Can't resolve AddStudentPresenterProtocol in AddStudent View Controller")
            }
            
            viewController.presenter = presenter
            return viewController
        }
    }
}
