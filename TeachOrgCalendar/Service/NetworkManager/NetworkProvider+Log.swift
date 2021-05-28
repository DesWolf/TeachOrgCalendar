//
//  NetworkProvider+Log.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

extension NetworkProvider {
    func logRequest(_ urlRequest: URLRequest) {
            NSLog("[REQUEST]")
            print(urlRequest.debugDescription)
            if let headers = urlRequest.allHTTPHeaderFields {
                NSLog("[HEADERS]")
                print(headers)
            }
            if let body = urlRequest.httpBody, let bodyString = String(data: body, encoding: .utf8) {
                NSLog("[REQUEST BODY]")
                print(bodyString)
            }
    }
}
