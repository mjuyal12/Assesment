//
//  BaseCoordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import Foundation

class BaseCoordinator : NSObject, Coordinator {
    var childCoordinators : [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement `start`.")
    }
}
