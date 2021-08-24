//
//  UIApplication+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/23/21.
//

import UIKit

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController, presented as? UISearchController == nil {
            return getTopViewController(base: presented)
        }
        return base
    }
}
