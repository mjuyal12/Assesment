//
//  LoginCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    private (set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC: LoginVC = .instantiate()
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        loginVC.viewModel = viewModel
        navigationController.setViewControllers([loginVC], animated: false)
    }
    
    func moveToTab() {
        let weatherCoordinator = WeatherCoordinator(navigationController: navigationController)
        childCoordinators.append(weatherCoordinator)
        weatherCoordinator.start()
    }
    
    func finish() {
        //childDidFinish(self)
    }
}
