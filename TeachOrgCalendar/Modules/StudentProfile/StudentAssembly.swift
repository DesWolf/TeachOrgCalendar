//
//  StudentProfileAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import Swinject

struct StudentAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StudentProfilePresenterProtocol.self) { (r, studentId: String) in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in StudentProfile Presenter")
            }
            
            guard let databaseManager = r.resolve(DatabaseManager.self) else {
                fatalError("Can't resolve DatabaseManager in StudentProfile Presenter")
            }
            
            return StudentProfilePresenter(moduleAssembly: moduleAssembly,
                                           databaseManager: databaseManager,
                                           studentId: studentId)
        }
        
        container.register(StudentProfileProtocol.self) { (r, studentId: String) in
            let viewController = StudentProfileViewController()
            
            guard let presenter = r.resolve(StudentProfilePresenterProtocol.self, argument: studentId) else {
                fatalError("Can't resolve StudentProfilePresenterProtocol in StudentProfile View Controller")
            }
            
            viewController.presenter = presenter
            return viewController
        }
    }
}
