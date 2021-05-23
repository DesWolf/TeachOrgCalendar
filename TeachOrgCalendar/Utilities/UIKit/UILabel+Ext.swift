//
//  UILabel+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 1/12/21.
//

import UIKit

extension UILabel {
    func set(font: UIFont, color: UIColor) {
        self.font = font
        self.textColor = color
    }
    
    func set(text: String, font: UIFont, color: UIColor) {
        self.text = text
        set(font: font, color: color)
    }
}
