//
//  TabBarViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//


import Foundation

protocol TabBarPresenterType {
    // MARK: - Input
    var viewController: TabBarViewControllerType! { get set }
    var tabBarController: TabBarController! { get set }
    
    // MARK: - Output
}

class TabBarPresenter {
    // MARK: - Input
    
    // MARK: - Output
    
    weak var viewController: TabBarViewControllerType!
    weak var tabBarController: TabBarController!
    private let moduleAssembly: ModuleAssemblyType
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
    

}

extension TabBarPresenter: TabBarPresenterType {}
