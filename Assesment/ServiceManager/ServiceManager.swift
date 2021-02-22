//
//  ServiceManager.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import Foundation

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

class ServiceManager {
    
    func fetchWeather<T: Decodable>(for city: String, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        var urlComponents = URLComponents(string: API.weather.service)
        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: "95adf29e9ca919fbf077447bbee7d3ec"),
            URLQueryItem(name: "units", value: "metric")
        ]
        
        guard let url = urlComponents?.url else {
            completionHandler(.failure(.badURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,                            // is there data
                  let response = response as? HTTPURLResponse,  // is there HTTP response
                  (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                  error == nil else {                           // was there no error, otherwise ...
                completionHandler(.failure(.somethingWentWrong(error?.localizedDescription)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let value = try decoder.decode(T.self, from: data)
                completionHandler(.success(value))
            } catch {
                completionHandler(.failure(.somethingWentWrong(error.localizedDescription)))
            }
        
        }
        task.resume()
    }
    
}


enum API {
    case weather
    var service: String {
        switch self {
        case .weather:
            return "http://api.openweathermap.org/data/2.5/weather"
        }
    }
}
