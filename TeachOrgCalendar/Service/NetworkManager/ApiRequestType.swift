//
//  ApiRequestType.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation
import Alamofire

public typealias HTTPHeaders = [String: String]

public enum HTTPMethod: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

public enum ContentType {
    case json, multipartFormData
    
    var headerKey: String {
        return "Content-Type"
    }
    
    var headerValue: String {
        switch self {
        case .json: return "application/json"
        case .multipartFormData: return "multipart/form-data"
        }
    }
}

public protocol ApiRequestType {
    var path: String { get }
    var method: HTTPMethod { get }
    var headerFields: HTTPHeaders? { get }
    var parameters: [String: Any]? { get }
    var contentType: ContentType { get }
//    var shouldIncludeTokenInRequest: Bool { get }
    var pageAttributes: String? { get }
}

extension ApiRequestType {
    var shouldIncludeTokenInRequest: Bool {
        true
    }
    
}

extension ApiRequestType {
    var contentType: ContentType { return .json }
    
    func asURLRequest() throws -> URLRequest {
        let attributes = pageAttributes ?? ""
        let fullPath = Configuration.apiBaseUrl + path + attributes
        guard let url = URL(string: fullPath) else { throw NetworkError.wrongRequest }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: Configuration.requestTimeoutInterval)
//        var headers = headerFields ?? [:]
//        if shouldIncludeTokenInRequest {
//            let appid = Configuration.token
//            headers["appid"] = "\(appid)"
//        }
        request.httpMethod = method.rawValue
//        request.allHTTPHeaderFields = headers
        let unwrappedParameters = parameters ?? [:]
        switch contentType {
        case .json:
            switch method {
            case .get:
                let encoding = URLEncoding(destination: .queryString)
                return try request.encoded(parameters: unwrappedParameters, parameterEncoding: encoding)
            case .post, .put, .patch, .delete:
                let encoding = JSONEncoding.default
                return try request.encoded(parameters: unwrappedParameters, parameterEncoding: encoding)
            default:
                fatalError("HTTP method not implemented")
            }
        case .multipartFormData:
            switch method {
            case .post, .patch:
                return try request.createMultipartData(parameters: unwrappedParameters)
            default:
                fatalError("HTTP method not implemented for Multipart form data")
            }
        }
        
    }
}
