//
//  ServiceManager.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import Foundation

class ServiceManager {
    
    
    /// Fetching weather (Currently specifying one way for webservice)
    /// - Parameters:
    ///   - city: City
    ///   - completionHandler: Completion on success or failue
    func fetchWeather<T: Decodable>(for city: String, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        let urlComponents = configureQuery(for: city)
        
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
    
    /// Generating query for Get Request
    /// - Parameter city: City
    /// - Returns: UrlComponent with Query
    private func configureQuery(for city: String) -> URLComponents? {
        var urlComponents = URLComponents(string: API.weather.service)
        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: ServiceConstant.weatherKey),
            URLQueryItem(name: "units", value: "metric")
        ]
        return urlComponents
    }
    
}
