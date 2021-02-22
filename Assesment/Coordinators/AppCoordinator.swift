//
//  AppCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private (set) var childCoordinators: [Coordinator] = []

    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    /// Starts the flow
    func start() {
        let navigationController = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
