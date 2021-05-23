//
//  ProfileViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol ProfilePresenterType {
    // MARK: - Input
    var viewController: ProfileViewControllerType! { get set }
    
    // MARK: - Output
}

class ProfilePresenter {
    // MARK: - Input
    
    // MARK: - Output
    
    weak var viewController: ProfileViewControllerType!
    private let moduleAssembly: ModuleAssemblyType
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension ProfilePresenter: ProfilePresenterType {}
