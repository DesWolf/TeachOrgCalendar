//
//  ProfileViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol ProfilePresenterProtocol {
    var viewController: ProfileViewProtocol! { get set }
    
}

class ProfilePresenter {
    
    // MARK: - Public properties
    
    weak var viewController: ProfileViewProtocol!
   
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {}
