//
//  TabBarCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class TabbarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController: TabBarVC = .instantiate()
        tabBarController.coordinator = self
        
        let weatherNavigationController = UINavigationController()
        weatherNavigationController.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun.rain"), selectedImage: UIImage(systemName: "cloud.sun.rain.fill"))
        weatherNavigationController.tabBarItem.tag = 0
        let weatherCoordinator = WeatherCoordinator(navigationController: weatherNavigationController)
        
        let chatNavigationController = UINavigationController()
        chatNavigationController.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        chatNavigationController.tabBarItem.tag = 1
        let chatCoordinator = ChatCoordinator(navigationController: chatNavigationController)

        childCoordinators.append(weatherCoordinator)
        childCoordinators.append(chatCoordinator)
        
        tabBarController.viewControllers = [weatherNavigationController,
                                            chatNavigationController]

        //tabBarController.modalPresentationStyle = .fullScreen
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([tabBarController], animated: false)
        weatherCoordinator.start()
        chatCoordinator.start()
    }
    
    func finish() {
        childDidFinish(self)
    }
    
}
