//
//  UIApplication+ Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 12/18/20.
//

import UIKit

extension UIApplication {
    
    /// Returns top view controller. If there UINavigationController of UITabBarController returns embended view controller
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class func rootViewController() -> UIViewController? {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        return rootVC
    }
    
    class func presentFromRoot(_ vc: UIViewController) {
        if let rootVC = rootViewController() {
            rootVC.present(vc, animated: true, completion: nil)
        }
    }
    
}
