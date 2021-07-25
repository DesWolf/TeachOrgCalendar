//
//  StudentsPresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol StudentsPresenterProtocol {
    var viewController: StudentsViewProtocol! { get set }
    
    func model(at index: IndexPath) -> SelfConfigurableViewModel
    func numberOfRows() -> Int
    func viewDidLoad() 
}

class StudentsPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: StudentsViewProtocol!
    
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly!
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension StudentsPresenter: StudentsPresenterProtocol {

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
