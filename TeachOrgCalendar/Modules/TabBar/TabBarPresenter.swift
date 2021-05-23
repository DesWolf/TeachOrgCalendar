//
//  TabBarViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//


import Foundation

protocol TabBarPresenterType {
    var viewController: TabBarViewControllerType! { get set }
    var tabBarController: TabBarController! { get set }
}

class TabBarPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: TabBarViewControllerType!
    weak var tabBarController: TabBarController!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension TabBarPresenter: TabBarPresenterType {}
