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
    static let token = "00d75cb6e4d6add16d6f455356b5cdab"
    static let requestTimeoutInterval: TimeInterval = 30
    
    static let termsOfServiceURL = URL(string: "https://vk.com/public203608271")!
    static let privacyPolisyURL = URL(string: "https://vk.com/public203608271")!

}

extension TimeInterval {
    static let defaultAnimDuration: TimeInterval = 0.3
    static let fastAnimDuration: TimeInterval = 0.15
}
