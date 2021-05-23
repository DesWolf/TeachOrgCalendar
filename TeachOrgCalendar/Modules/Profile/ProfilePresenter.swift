//
//  ProfileViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol ProfilePresenterType {
    var viewController: ProfileViewControllerType! { get set }
    
}

class ProfilePresenter {
    
    // MARK: - Public properties
    
    weak var viewController: ProfileViewControllerType!
   
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension ProfilePresenter: ProfilePresenterType {}
