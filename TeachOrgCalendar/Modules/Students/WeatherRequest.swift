//
//  SearchRequest.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

enum WeatherRequest {
    case search(city: String)
}

extension WeatherRequest: ApiRequestType {
    
    var shouldIncludeTokenInRequest: Bool { true }
    
    var path: String {
        switch self {
        case .search:
            return "weather?q="
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .post
        }
    }
    
    var headerFields: HTTPHeaders? {
        nil
    }
    
    var parameters: [String: Any]? {
        switch self {
        case let .search(city):
            return [
                "q": city
            ]
        }
    }
    
    var pageAttributes: String? {
        return "Moscow&appid=5413b464dd02b162651d5d7f9c6f7174"
    }
}
