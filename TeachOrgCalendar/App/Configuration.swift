//
//  Configuration.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

struct Configuration {

    static let domain = "https://api.openweathermap.org"// dev
    //    static let domain = "" //  test
    //    static let domain = "" // prod
    static let apiBaseUrl = "\(domain)/data/2.5/"
    static let token = ""
    static let requestTimeoutInterval: TimeInterval = 30

}

extension TimeInterval {
    static let defaultAnimDuration: TimeInterval = 0.3
    static let fastAnimDuration: TimeInterval = 0.15
}
