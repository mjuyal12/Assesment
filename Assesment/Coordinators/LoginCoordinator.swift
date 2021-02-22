//
//  LoginCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let loginVC: LoginVC = .instantiate()
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        loginVC.viewModel = viewModel
        navigationController.setViewControllers([loginVC], animated: false)
    }
    
    func moveToTab() {
        let weatherCoordinator = WeatherCoordinator(navigationController: navigationController)
        store(coordinator: weatherCoordinator)
        weatherCoordinator.start()
    }
    
    func finish() {
        childDidFinish(self)
    }
}
