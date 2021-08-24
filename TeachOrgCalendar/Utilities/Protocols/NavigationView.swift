//
//  NavigationView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 12/18/20.
//

import UIKit

protocol NavigatingView {
    @discardableResult
    func push(viewController: UIViewController, animated: Bool) -> Bool
    @discardableResult
    func pushOverAll(viewController: UIViewController, animated: Bool) -> Bool
}

extension NavigatingView where Self: UIViewController {
    @discardableResult
    func push(viewController: UIViewController, animated: Bool = true) -> Bool {
        guard let navi = navigationController else { return false }
        navi.pushViewController(viewController, animated: animated)
        return true
    }
    
    @discardableResult
    func pushOverAll(viewController: UIViewController, animated: Bool) -> Bool {
        guard
            let topController = UIApplication.topViewController(),
            let navi = topController.navigationController
        else { return false }
        navi.pushViewController(viewController, animated: animated)
        return true
    }
    
//    func presentInNavigation(viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
//        let navi = UINavigationController(rootViewController: viewController)
//        navi.modalPresentationStyle = .fullScreen
//        present(navi, animated: true, completion: completion)
//    }
}
