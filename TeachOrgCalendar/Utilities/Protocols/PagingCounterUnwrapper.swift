//
//  PagingCounterUnwrapper.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol PagingCounterUnwrapper {
    var count: Int? { get set }
    var unwrappedCount: Int { get }
}

extension PagingCounterUnwrapper {
    var unwrappedCount: Int {
        count ?? 0
    }
}
