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

    /*
     Base Coordinator
     Coordinators subclasses BaseCoordinator
     Start func will contains controller viewmodel for specific controller
     Appends coordinator to Array
     */
    func start() {
        fatalError("Children should implement `start`.")
    }
}
