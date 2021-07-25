//
//  WeatherResponse.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

struct WeatherResponse: Decodable, PagingCounterUnwrapper {
    let weather: [Weather]
    var count: Int?
}
