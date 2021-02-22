//
//  ServiceConstants.swift
//  Assesment
//
//  Created by Mayank Juyal on 22/02/21.
//

import Foundation

/// Constants
struct ServiceConstant {
    static let weatherURL = "http://api.openweathermap.org/data/2.5/weather"
    static let weatherKey = "95adf29e9ca919fbf077447bbee7d3ec"
    static let weatherIconURL = "https://openweathermap.org/img/w/%@.png"
}

/// Network error
enum NetworkError: Error {
    case badURL
    case somethingWentWrong(String?)
    var message: String {
        switch self {
        case .badURL:
            return "URL was not good"
        case .somethingWentWrong(let message):
            return message ?? ""
        }
    }
}

/// API Points
enum API {
    case weather
    var service: String {
        switch self {
        case .weather:
            return ServiceConstant.weatherURL
        }
    }
}


