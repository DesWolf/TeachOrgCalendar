//
//  NetworkProvider.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation
import SwiftyJSON

protocol CancellableRequest {
    func cancel()
}

extension URLSessionDataTask: CancellableRequest { }

class NetworkProvider<Type: ApiRequestType> {
    /// Performs completion on the main thread
    @discardableResult
    func perform<T: Decodable>(request: Type,
                               decoderStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
                               shouldSendToMainThread: Bool = true,
                               isWithLogging: Bool = true,
                               completion: @escaping (Result<T, NetworkError>) -> Void) -> CancellableRequest? {
        guard let urlRequest = try? request.asURLRequest() else {
            DispatchQueue.main.async {
                completion(.failure(.wrongRequest))
            }
            return nil
        }
        if isWithLogging {
            logRequest(urlRequest)
        }
        let taskCompletion = taskCompletionHandler(request: request, decoderStrategy: decoderStrategy, shouldSendToMainThread: shouldSendToMainThread, isWithLogging: isWithLogging, completion: completion)
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: taskCompletion)
        task.resume()
        return task
    }
    
    @discardableResult
    func perform(request: Type,
                 decoderStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
                 shouldSendToMainThread: Bool = true,
                 isWithLogging: Bool = false,
                 completion: @escaping (Result<Bool, NetworkError>) -> Void) -> CancellableRequest? {
        guard let urlRequest = try? request.asURLRequest() else {
            completion(.failure(.wrongRequest))
            return nil
        }
        if isWithLogging {
            logRequest(urlRequest)
        }
        let taskCompletion = taskCompletionHandler(request: request, decoderStrategy: decoderStrategy, shouldSendToMainThread: shouldSendToMainThread, isWithLogging: isWithLogging, isExpectingEmptyResponse: true, completion: completion)
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: taskCompletion)
        task.resume()
        return task
    }
    
    @discardableResult
    func performHeaderRequest<T: HeaderAdditionalInfoType>(request: Type,
                                                           shouldSendToMainThread: Bool = true,
                                                           isWithLogging: Bool = true,
                                                           completion: @escaping (Result<HeaderResponse<T>, NetworkError>) -> Void) -> CancellableRequest? {
        guard let urlRequest = try? request.asURLRequest() else {
            
            return nil
        }
        if isWithLogging {
            logRequest(urlRequest)
        }
        let completion = headerTaskResponseHandler(request: request, shouldSendToMainThread: shouldSendToMainThread, isWithLogging: isWithLogging, completion: completion)
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
        task.resume()
        return task
    }
}
