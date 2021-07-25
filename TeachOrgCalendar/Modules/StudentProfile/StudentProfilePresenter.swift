//
//  StudentProfilePresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import Foundation

protocol StudentProfilePresenterProtocol {
    var viewController: StudentProfileViewController! { get set }
    func viewDidLoad()
}

class StudentProfilePresenter {
    
    // MARK: - Public properties
    
    weak var viewController: StudentProfileViewController!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension StudentProfilePresenter: StudentProfilePresenterProtocol {
    func viewDidLoad() {

    }
}
