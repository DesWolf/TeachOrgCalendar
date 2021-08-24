//
//  LaunchViewPresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/25/21.
//

import Foundation

protocol LaunchPresenterProtocol {
    var view: LaunchViewProtocol! { get set }
    
    func viewDidLoad()
}

class LaunchPresenter {
    
    // MARK: - Public properties
    
    weak var view: LaunchViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension LaunchPresenter: LaunchPresenterProtocol {
    func viewDidLoad() {
    }
}
