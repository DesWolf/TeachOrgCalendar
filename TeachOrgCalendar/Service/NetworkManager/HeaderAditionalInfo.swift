//
//  HeaderAditionalInfo.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol HeaderAdditionalInfoType {
    init(from: [AnyHashable: Any])
}

struct EmptyHeaderAdditionalInfo: HeaderAdditionalInfoType {
    init(from: [AnyHashable : Any]) { }
}
