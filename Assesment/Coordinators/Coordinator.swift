//
//  Coordinator.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit
/**Protocol to manage Coordinator*/
protocol Coordinator: class {
    // Child Coordinators storing child for each coordinator
    var childCoordinators: [Coordinator] { get }
    func start()
}
