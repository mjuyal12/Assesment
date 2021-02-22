//
//  WeatherViewModel.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import Foundation

class WeatherViewModel {
    
    var coordinator: WeatherCoordinator?
    private var cities: [String] = ["Delhi", "Mumbai", "Bangalore"]
    
    private var weatherDetails: [WeatherModel] = []
    
    private var weatherModel: WeatherModel? {
        didSet {
            if let weatherModel = weatherModel {
                weatherDetails.append(weatherModel)
            }
        }
    }
    
    var fetchedDetails: (()->Void)?
    var error: ((String?)->Void)?
    
    var count: Int {
        return weatherDetails.count
    }
    
    func fetchWeatherDetails() {
        let group = DispatchGroup()
        
        cities.forEach { (city) in
            group.enter()
            print("Call for City ===> ", city)
            ServiceManager().fetchWeather(for: city) { (result: Result<WeatherModel, NetworkError>) in
                switch result {
                case .success(let model):
                    self.weatherModel = model
                case .failure(_):
                    break
                }
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            self.fetchedDetails?()
        }
        
    }
    
    func getWeather(at index: Int) -> WeatherModel {
        return weatherDetails[index]
    }
    
    func saveWeatherDetails() {
        do {
            let jsonEncoder = JSONEncoder()
            let weatherData = try jsonEncoder.encode(weatherDetails)
            CoreDataManager.shared.saveWeather(data: weatherData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func localDBWeatherDetails() {
        let details = CoreDataManager.shared.fetchWeatherDetails()
        if let unwrappedDetails = details {
            print(unwrappedDetails.count)
            
            for obj in unwrappedDetails {
                if let weatherData = obj.weather as? Data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let weatherObj = try jsonDecoder.decode([WeatherModel].self, from: weatherData)
                        print(weatherObj.count)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func showDetails(forRow index: Int) {
        let data = weatherDetails[index]
        coordinator?.navigateToDetails(withData: data)
    }
    
}
