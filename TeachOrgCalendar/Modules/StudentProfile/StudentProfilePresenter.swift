//
//  StudentProfilePresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import Foundation

protocol StudentProfilePresenterType {
    var viewController: StudentProfileViewController! { get set }
    func viewDidLoad()
}

class StudentProfilePresenter {
    
    // MARK: - Public properties
    
    weak var viewController: StudentProfileViewController!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension StudentProfilePresenter: StudentProfilePresenterType {
    func viewDidLoad() {

    }
}
