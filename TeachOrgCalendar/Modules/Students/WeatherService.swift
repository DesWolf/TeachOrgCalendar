//
//  SearchService.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol WeatherServiceType {
    func load(completion: @escaping (Result<[Weather], Error>) -> Void)
}

class WeatherService {
    let network = NetworkProvider<WeatherRequest>()
    var city: String = "Moscow"
}

extension WeatherService: WeatherServiceType {
    typealias ItemType = Weather
    func load(completion: @escaping (Result<[Weather], Error>) -> Void) {
        network.perform(request: .search(city: city)) { (result: Result<WeatherResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(.success(response.weather))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
//    func load(page: Int, pageSize: Int, completion: @escaping (Result<([Weather], Int), Error>) -> Void) -> CancellableRequest? {
//        return network.perform(request: .search(city: text, page: page, pageSize: pageSize)) { (result: Result<WeatherResponseItem, NetworkError>) in
//            switch result {
//            case let .success(responseItem):
//                let weather = responseItem.weather
//                completion(.success((weather, responseItem.unwrappedCount)))
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
}
