//
//  UserManager.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol UserManagerType {
    func navigateToMainScreen()
}

final class UserManager {
    
    private let appNavigator: AppNavigatorType
    
    
    init(appNavigator: AppNavigatorType) {
        self.appNavigator = appNavigator
    }
    
    func navigateToMainScreen() {
        appNavigator.navigate(to: .mainPage, transitionCompletionHandler: nil)
    }
}

extension UserManager: UserManagerType { }
