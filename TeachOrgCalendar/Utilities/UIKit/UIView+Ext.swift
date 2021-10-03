//
//  UIView+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    func didSelect() {
        layer.cornerRadius = 10
        backgroundColor = .selectViewBackground
        layer.borderColor = UIColor.clear.cgColor
    }
    
    func didDeselect() {
        layer.cornerRadius = 10
        backgroundColor = .deselectViewBackground
        layer.borderColor = UIColor.border.cgColor
        layer.borderWidth = 0.5
    }
}
