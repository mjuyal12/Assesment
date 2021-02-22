//
//  WeatherModel.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import Foundation

struct WeatherModel: Codable {
    var name: String?
    var weather: [Weather]?
    var main: Main?
}

struct Weather: Codable {
    var main: String?
    var description: String?
    var icon: String?
}

struct Main: Codable {
    var temp: Float?
}
