//
//  LoginPresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol LoginPresenterProtocol {
    var view: LoginViewProtocol! { get set }
    
    func viewDidLoad()
}

class LoginPresenter {
    
    // MARK: - Public properties
    
    weak var view: LoginViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func viewDidLoad() {
    }
}
