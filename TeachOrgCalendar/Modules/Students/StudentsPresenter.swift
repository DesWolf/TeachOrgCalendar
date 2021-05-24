//
//  StudentsPresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol StudentsPresenterType {
    var viewController: StudentsViewControllerType! { get set }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel
    func numberOfRows() -> Int
    func viewDidLoad() 
}

class StudentsPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: StudentsViewControllerType!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType!
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension StudentsPresenter: StudentsPresenterType {

    func viewDidLoad() {
    }
    
    func numberOfRows() -> Int {
        return 1
    }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel {
        // TODO: Add Firebase Detabase
        
        return StudentCellViewModel(name: "Max", surname: "Okuneev", discipline: "English")
    }
}
