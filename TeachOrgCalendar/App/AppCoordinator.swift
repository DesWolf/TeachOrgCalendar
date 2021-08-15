//
//  AppCoordinator.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol AppCoordinatorProtocol {
    func navigateToMainScreen()
    func navigateToLogin()
}

final class AppCoordinator {
    
    private let appNavigator: AppNavigator
    
    init(appNavigator: AppNavigator) {
        self.appNavigator = appNavigator
    }
    
    func navigateToMainScreen() {
        appNavigator.navigate(to: .mainPage, transitionCompletionHandler: nil)
    }
    
    func navigateToLogin() {
        appNavigator.navigate(to: .login, transitionCompletionHandler: nil)
    }
}

extension AppCoordinator: AppCoordinatorProtocol { }
