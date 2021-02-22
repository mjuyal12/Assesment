//
//  WeatherDetailCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import UIKit

class WeatherDetailCoordinator: BaseCoordinator, UINavigationControllerDelegate {
    
    private let navigationController: UINavigationController
    
    var weatherDetails: WeatherModel?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        navigationController.delegate = self
        let weatherDetailsVC: WeatherDetailsVC = .instantiate()
        let viewModel = WeatherDetailsViewModel()
        viewModel.coordinator = self
        viewModel.weatherDetails = weatherDetails
        weatherDetailsVC.viewModel = viewModel
        self.navigationController.pushViewController(weatherDetailsVC, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard let fromController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromController) {
            return
        }
        if let _ = fromController as? WeatherDetailsVC {
            self.childDidFinish(self)
        }
    }
    
}