//
//  TabBarViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//


import Foundation

protocol TabBarPresenterProtocol {
    var viewController: TabBarViewProtocol! { get set }
    var tabBarController: TabBarController! { get set }
}

class TabBarPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: TabBarViewProtocol!
    weak var tabBarController: TabBarController!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension TabBarPresenter: TabBarPresenterProtocol {}
