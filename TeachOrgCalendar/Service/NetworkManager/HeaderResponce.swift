//
//  HeaderResponce.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

struct HeaderResponse<T: HeaderAdditionalInfoType> {
    let code: Int
    let additionalInfo: T?
}
