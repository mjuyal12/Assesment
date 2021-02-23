//
//  WeatherViewModel.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import Foundation

class WeatherViewModel {
    
    var coordinator: WeatherCoordinator?
    var fetchedDetails: (()->Void)?
    var error: ((String?)->Void)?
    
    private var cities: [String] = ["Delhi", "Mumbai", "Bangalore"]
    private var weatherDetails: [WeatherModel] = []
    private var weatherModel: WeatherModel? {
        didSet {
            if let weatherModel = weatherModel {
                weatherDetails.append(weatherModel)
            }
        }
    }
    private let serviceManager = ServiceManager()
    
    var count: Int {
        return weatherDetails.count
    }
    
    /**Fetches Weather details for the Cities*/
    func fetchWeatherDetails() {
        let group = DispatchGroup()
        
        cities.forEach { (city) in
            group.enter()
            print("Call for City ===> ", city)
            serviceManager.fetchWeather(for: city) { [weak self] (result: Result<WeatherModel, NetworkError>) in
                switch result {
                case .success(let model):
                    self?.weatherModel = model
                case .failure(let error):
                    self?.serviceManager.cancel()
                    self?.error?(error.message)
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
    /**Handling save details to Core Data*/
    func saveWeatherDetails() {
        do {
            let jsonEncoder = JSONEncoder()
            let weatherData = try jsonEncoder.encode(weatherDetails)
            CoreDataManager.shared.saveWeather(data: weatherData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /**Handling Fetching saved details in Core Data*/
    func localDBWeatherDetails() {
        let details = CoreDataManager.shared.fetchWeatherDetails()
        if let unwrappedDetails = details?.first,
            let weatherData = unwrappedDetails.weather as? Data {
            let object = try? weatherData.decoded(as: [WeatherModel].self)
            print("Saved Object ===> ", object)
        }
    }
    
    func showDetails(forRow index: Int) {
        let data = weatherDetails[index]
        coordinator?.navigateToDetails(withData: data)
    }
    
}
