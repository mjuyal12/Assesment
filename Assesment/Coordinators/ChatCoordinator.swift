//
//  ChatCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class ChatCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let chatVC: ChatVC = .instantiate()
        chatVC.coordinator = self
        
        navigationController.pushViewController(chatVC, animated: false)
    }
}
