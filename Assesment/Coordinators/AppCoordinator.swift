//
//  AppCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    //var navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow) {
        //self.navigationController = navigationController
        self.window = window
    }
    
    override func start() {
        let navigationController = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
