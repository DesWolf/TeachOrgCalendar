//
//  FirstPageViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol LoginPresenterType {
    var viewController: LoginViewController! { get set }
    func viewDidLoad()
}

class LoginPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: LoginViewController!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension LoginPresenter: LoginPresenterType {
    func viewDidLoad() {
        print("sdfsdfsdf")
    }
}
