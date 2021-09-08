//
//  Repeatedly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/7/21.
//

import Foundation

enum Repeatedly: String, CaseIterable {
    case none = "Никогда"
    case everyDay = "каждый день"
    case weekly = "каждую неделю"
    case monthly = "каждый месяц"
    case yearly = "каждый год"
    
    var nameEnum: String {
        return Mirror(reflecting: self).children.first?.label ?? String(describing: self)
    }

    static func byName(name: String) -> Repeatedly {
        return Repeatedly.allCases.first(where: {$0.nameEnum.elementsEqual(name)}) ?? .none
    }
}
