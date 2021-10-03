//
//  String+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 10/3/21.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

}
