//
//  StudentProfileAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//


import Swinject

struct StudentAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StudentPresenterProtocol.self) { (r, student: Student) in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in StudentProfile Presenter")
            }
            
            guard let databaseManager = r.resolve(DatabaseManager.self) else {
                fatalError("Can't resolve DatabaseManager in StudentProfile Presenter")
            }
            
            return StudentPresenter(moduleAssembly: moduleAssembly,
                                    databaseManager: databaseManager,
                                    student: student)
        }
        
        container.register(StudentViewProtocol.self) { (r, student: Student) in
            let viewController = StudentViewController()
            
            guard let presenter = r.resolve(StudentPresenterProtocol.self, argument: student) else {
                fatalError("Can't resolve StudentProfilePresenterProtocol in StudentProfile View Controller")
            }
            
            presenter.view = viewController
            viewController.presenter = presenter
            
            return viewController
        }
    }
}
