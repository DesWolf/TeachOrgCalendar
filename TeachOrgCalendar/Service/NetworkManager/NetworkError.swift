//
//  NetworkError.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

enum NetworkError: Error {
    case wrongRequest
    case nilResponse
    case wrongHeaderType
    case encodableMapping(Error)
    case decodableMapping(raw: String?)
    case parameterEncoding(Error)
    case responseError(Error?)
    case backendError(ApiResponseError)
}

protocol DiplayDescriptable {
    var displayMessage: String { get }
}

extension NetworkError: DiplayDescriptable {
    var displayMessage: String {
        switch self {
        case .decodableMapping(let raw):
            return raw ?? "Неизвестный формат данных от сервера"
        case let .backendError(err):
            return "\(err.message) (Код ошибки: \(err.code))"
        case .responseError(let error):
            if let error = error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                return Strings.Errors.noInternetConnection
            }
            return error?.localizedDescription ?? localizedDescription
        default:
            return localizedDescription
        }
    }
}
