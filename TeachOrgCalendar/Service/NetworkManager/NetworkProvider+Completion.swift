//
//  NetworkProvider+Completion.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation
import SwiftyJSON

extension NetworkProvider {
    
    /// When true is passed for isExpectingEmptyResponse
    /// it is expected that generic parameter is Bool
    func taskCompletionHandler<T: Decodable>(request: Type,
                                             decoderStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
                                             shouldSendToMainThread: Bool = true,
                                             isWithLogging: Bool = true,
                                             isExpectingEmptyResponse: Bool = false,
                                             completion: @escaping (Result<T, NetworkError>) -> Void)
        -> (Data?, URLResponse?, Error?) -> Void {
        return {
            (data: Data?, response: URLResponse?, error: Error?) in
            guard let unwrappedData = data else {
                DispatchQueue.main.async {
                    completion(.failure(.responseError(error)))
                }
                return
            }
            
            if isWithLogging {
                NSLog("[RESPONSE] \(request.path)")
                if let json = try? JSON(data: unwrappedData) {
                    print(json)
                } else if let responseString = String(data: unwrappedData, encoding: .utf8) {
                    print(responseString)
                }
            }
            
//            if let httpResponse = response as? HTTPURLResponse, NetworkProvider.isAuthTokenExpired(request: request, response: httpResponse, completion: { [weak self] (result) in
//                switch result {
//                case .success:
//                    print("Auth token updated")
//                    self?.perform(request: request, decoderStrategy: decoderStrategy, dateDecodingStrategy: dateDecodingStrategy, isWithLogging: isWithLogging, completion: completion)
//                case .failure(let error):
//                    print("Failed to update auth token.", error.displayMessage)
//                }
//
//            }) {
//                return
//            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = decoderStrategy
                
                if isExpectingEmptyResponse {
                    let decodedObject = try decoder.decode(ApiEmptyResponseFormat.self, from: unwrappedData)
                    let completion = {
                        if let backendError = decodedObject.error {
                            completion(.failure(.backendError(backendError)))
                        } else {
                            // when true is passed for isExpectingEmptyResponse
                            // it is expected <T> generic parameter to be Bool
                            if let result = decodedObject.success as? T {
                                completion(.success(result))
                            } else {
                                completion(.failure(.wrongRequest))
                            }
                        }
                    }
                    if shouldSendToMainThread {
                        DispatchQueue.main.async {
                            completion()
                        }
                    } else {
                        completion()
                    }
                } else {
                    let decodedObject = try decoder.decode(ApiResponseFormat<T>.self, from: unwrappedData)
                    let completion = {
                        if let backendError = decodedObject.error {
                            completion(.failure(NetworkError.backendError(backendError)))
                            return
                        }
                        if let result = decodedObject.response {
                            completion(.success(result))
                            return
                        } else {
                            completion(.failure(.nilResponse))
                        }
                    }
                    if shouldSendToMainThread {
                        DispatchQueue.main.async {
                            completion()
                        }
                    } else { completion() }
                }
            } catch {
                if let urlRequest = try? request.asURLRequest() {
                    print("Error \(error) for request: \(urlRequest.debugDescription) Request method: \(String(describing: urlRequest.method))\n\(String(describing: urlRequest.allHTTPHeaderFields))\n\(String(describing: request.parameters))")
                } else {
                    print("Error \(error) for request path: \(request.path), params \(String(describing: request.parameters))")
                }
                
                let completion = {
                    let error: NetworkError
                    if let responseString = String(data: unwrappedData, encoding: .utf8) {
                        error = .decodableMapping(raw: responseString)
                    } else {
                        error = .decodableMapping(raw: nil)
                    }
                    print("Network error: \(error)")
                    completion(.failure(error))
                }
                if shouldSendToMainThread {
                    DispatchQueue.main.async {
                        completion()
                    }
                } else { completion() }
            }
            
        }
    }
    
    func headerTaskResponseHandler<T: HeaderAdditionalInfoType>(request: Type,
                                                                shouldSendToMainThread: Bool = true,
                                                                isWithLogging: Bool = true,
                                                                completion: @escaping (Result<HeaderResponse<T>, NetworkError>) -> Void) -> (Data?, URLResponse?, Error?) -> Void {
        return {
            (_: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error occured while process header task response: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(.responseError(error)))
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Failed to cast response to HTTPURLResponse")
                DispatchQueue.main.async {
                    completion(.failure(.wrongHeaderType))
                }
                return
            }
            if isWithLogging {
                print("[RESPONSE] \(request.path)")
                print(httpResponse)
            }
            let headerResponse = HeaderResponse(code: httpResponse.statusCode, additionalInfo: T.init(from: httpResponse.allHeaderFields))
            if shouldSendToMainThread {
                DispatchQueue.main.async {
                    completion(.success(headerResponse))
                }
            } else {
                completion(.success(headerResponse))
            }
        }
    }
}
