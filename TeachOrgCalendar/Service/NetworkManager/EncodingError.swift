//
//  EncodingError.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

enum EncodingError: Error {
    case unsupportedDataType
    
    var localizedDescription: String {
        switch self {
        case .unsupportedDataType: return "Не удалось сконвертировать входные данные (неподдерживаиемый тип)"
        }
    }
}
