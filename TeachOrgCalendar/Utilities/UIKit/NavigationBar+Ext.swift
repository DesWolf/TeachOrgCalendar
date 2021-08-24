//
//  NavigationBar+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/22/21.
//

import UIKit

extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}
