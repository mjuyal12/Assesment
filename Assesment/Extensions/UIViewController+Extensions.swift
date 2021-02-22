//
//  UIViewController+Extensions.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

extension UIViewController {
    
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
    
}


