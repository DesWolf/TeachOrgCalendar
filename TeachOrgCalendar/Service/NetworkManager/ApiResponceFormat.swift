//
//  ApiResponceFormat.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

struct ApiResponseError: Decodable {
    let message: String
    let code: Int
}

struct ApiResponseFormat<T: Decodable>: Decodable {
    
    let success: Bool
    let response: T?
    let error: ApiResponseError?
}

struct ApiEmptyResponseFormat: Decodable {
    
    let success: Bool
    let error: ApiResponseError?
    
}
