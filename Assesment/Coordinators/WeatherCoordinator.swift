//
//  WeatherCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class WeatherCoordinator: Coordinator {
    
    private (set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let weatherVC: WeatherVC = .instantiate()
        let weatherViewModel = WeatherViewModel()
        weatherViewModel.coordinator = self
        weatherVC.viewModel = weatherViewModel
        navigationController.pushViewController(weatherVC, animated: false)
    }
    
    func navigateToDetails(withData weatherData: WeatherModel) {
        let weatherCoordinator = WeatherDetailCoordinator(navigationController: navigationController)
        weatherCoordinator.weatherDetails = weatherData
        weatherCoordinator.removeCoordinator = { [weak self] (childCoordinator) in
            guard let strongSelf = self else { return }
            strongSelf.childCoordinators = strongSelf.childCoordinators.filter { $0 !== childCoordinator }
        }
        childCoordinators.append(weatherCoordinator)
        weatherCoordinator.start()
    }
}
    
    
