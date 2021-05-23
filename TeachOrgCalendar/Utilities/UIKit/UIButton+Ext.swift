//
//  UIButton+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 1/12/21.
//

import UIKit

extension UIButton {
    
    func set(font: UIFont, color: UIColor) {
        setTitleColor(color, for: .normal)
        guard let label = titleLabel else {
            setAttributedTitle(NSAttributedString(string: currentTitle!,
                                                  attributes: [NSAttributedString.Key.kern:0,
                                                               NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular),
                                                               NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle().alignment = .center]),
                               for: .normal)
            return
        }
        label.font = font
    }
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        clipsToBounds = true
        let colorImage = color.image()
        setBackgroundImage(colorImage, for: forState)
    }
    
    func updateAttributedTitle(_ text: String) {
        setTitle(text, for: .normal)
    }
}
