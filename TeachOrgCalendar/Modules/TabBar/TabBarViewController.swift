//
//  TabBarViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import SnapKit

protocol TabBarViewControllerType: class, PresentingView, NavigatingView {
    var presenter: TabBarPresenterType! { get set }
}

protocol TabBarController: class {
    func navigateToDownloads(disablingTabs: Bool)
    func disableTabs()
    func enableTabs()
}

enum TabType {
    case students, calendar, profile
    
    var tabIndex: Int {
        switch self {
        case .students: return 0
        case .calendar: return 1
        case .profile: return 2
        }
    }
}

class TabBarViewController: UITabBarController {

    var presenter: TabBarPresenterType!
    
    private var prevSelectedVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.barTintColor = .background
        tabBar.isTranslucent = false
        
        tabBar.tintColor = .selectedTabItem
        tabBar.unselectedItemTintColor = .tabItem
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        prevSelectedVC = tabBarController.selectedViewController
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let navi = prevSelectedVC as? UINavigationController {
            navi.popToRootViewController(animated: true)
            prevSelectedVC = nil
        }
    }
}

extension TabBarViewController: TabBarViewControllerType {}
