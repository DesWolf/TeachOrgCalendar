//
//  StudentsPresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol StudentsPresenterType {
    // MARK: - Input
    var viewController: StudentsViewControllerType! { get set }
    
    // MARK: - Output
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel
    func numberOfRows() -> Int
    func viewDidLoad() 
}

class StudentsPresenter {
    
    // MARK: - Input
    weak var viewController: StudentsViewControllerType!
    private let moduleAssembly: ModuleAssemblyType!
    
    // MARK: - Output
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension StudentsPresenter: StudentsPresenterType {

    func viewDidLoad() {
        print("11111")
    }
    
    func numberOfRows() -> Int {
        return 1
    }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel {
        // TODO: Add Firebase Storage
        
        return StudentCellViewModel(name: "Max", surname: "Okuneev", discipline: "English")
    }
}
