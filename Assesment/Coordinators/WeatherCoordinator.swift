//
//  WeatherCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class WeatherCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let weatherVC: WeatherVC = .instantiate()
        let weatherViewModel = WeatherViewModel()
        weatherViewModel.coordinator = self
        weatherVC.viewModel = weatherViewModel
        navigationController.pushViewController(weatherVC, animated: false)
    }
    
    func navigateToDetails(withData weatherData: WeatherModel) {
        let weatherCoordinator = WeatherDetailCoordinator(navigationController: navigationController)
        weatherCoordinator.weatherDetails = weatherData
        store(coordinator: weatherCoordinator)
        weatherCoordinator.start()
    }
}
    
    
