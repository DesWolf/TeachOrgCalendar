//
//  URLRequest+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit
import Alamofire

struct AnyEncodable: Encodable {

    private let encodable: Encodable
    
    public init(_ encodable: Encodable) {
        self.encodable = encodable
    }
    
    func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}

extension URLRequest {

    mutating func encoded(encodable: Encodable, encoder: JSONEncoder = JSONEncoder()) throws -> URLRequest {
        do {
            let encodable = AnyEncodable(encodable)
            httpBody = try encoder.encode(encodable)

            let contentTypeHeaderName = "Content-Type"
            if value(forHTTPHeaderField: contentTypeHeaderName) == nil {
                setValue("application/json", forHTTPHeaderField: contentTypeHeaderName)
            }

            return self
        } catch {
            throw NetworkError.encodableMapping(error)
        }
    }

    func encoded(parameters: [String: Any], parameterEncoding: ParameterEncoding) throws -> URLRequest {
        do {
            return try parameterEncoding.encode(self, with: parameters)
        } catch {
            throw NetworkError.parameterEncoding(error)
        }
    }
    
    mutating func createMultipartData(parameters: [String: Any]) throws -> URLRequest {
       let data = MultipartFormData()
       for (name, info) in parameters {
           let dataToAppend: Data
           if let image = info as? UIImage,
               let imageData = image.jpegData(compressionQuality: 0) {
               dataToAppend = imageData
               data.append(dataToAppend, withName: name, fileName: "untitled.jpg", mimeType: "image/jpeg")
           } else if let string = info as? String {
               guard let stringData = string.data(using: .utf8) else { continue }
               dataToAppend = stringData
               data.append(dataToAppend, withName: name)
           } else {
               throw NetworkError.parameterEncoding(EncodingError.unsupportedDataType)
           }
       }
       do {
           httpBody = try data.encode()
       } catch {
           throw NetworkError.parameterEncoding(error)
       }
       let contentTypeHeaderName = "Content-Type"
       if value(forHTTPHeaderField: contentTypeHeaderName) == nil {
           setValue("multipart/form-data; boundary=\(data.boundary)", forHTTPHeaderField: contentTypeHeaderName)
       }
       return self
   }
}
