//
//  UIFont+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 1/12/21.
//

import UIKit

extension UIFont {
    class var title: UIFont {
      return UIFont.systemFont(ofSize: 28.0, weight: .semibold)
    }
    
    class var mediumText: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .semibold)
    }
    
    class var regularText: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .regular)
    }
    
    class var smallDescription: UIFont {
      return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
    
    class var button: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .regular)
    }
    
    class var eventTitle: UIFont {
      return UIFont.systemFont(ofSize: 17.0, weight: .regular)
    }
    
}


