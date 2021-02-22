//
//  Coordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    //var navigationController: UINavigationController { get set }
    func start()
    func childDidFinish(_ child: Coordinator?)
    
}

extension Coordinator {
    
    func childDidFinish(_ child: Coordinator?) {
        childCoordinators = childCoordinators.filter { $0 !== child }
    }
    
}
