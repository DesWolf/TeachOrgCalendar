//
//  AppNavigator.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol AppNavigatorType {
    func navigate(to route: AppNavigationRoute, transitionCompletionHandler: ((Bool) -> Void)?)
}

enum AppNavigationRoute {
    case login
    case mainPage
}

struct AppNavigator {
    private let moduleAssembly: ModuleAssembly
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension AppNavigator: AppNavigatorType {
    func navigate(to route: AppNavigationRoute, transitionCompletionHandler: ((Bool) -> Void)?) {
        let controller: UIViewController
        switch route {
        case .mainPage: 
            if UIApplication.rootViewController() is TabBarViewController { return }
            guard let tabBar = try? moduleAssembly.assembledView(for: .tabBar) else {
                fatalError("Failed to instantiate tab bar at launch")
            }
            controller = tabBar
        
        case .login:
            guard let login = try? moduleAssembly.assembledView(for: .login) else {
                fatalError("Failed to instantiate onboarding view")
            }
            controller = login
        }
        
        transition(to: controller, completion: transitionCompletionHandler)
}
}

extension AppNavigator: WindowTransitioner { }
