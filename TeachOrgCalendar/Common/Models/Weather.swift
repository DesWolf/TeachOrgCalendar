//
//  Weather.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}
