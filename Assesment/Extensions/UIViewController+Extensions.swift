//
//  UIViewController+Extensions.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

extension UIViewController {
    
    /// Instantiate controller
    /// - Returns: Controller
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
    
}

extension UITableView {
    
    /// Instantiate UITableViewCell
    /// - Returns: UITableViewCell
    func instantiateCell<T: UITableViewCell>() -> T? {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
        return cell
    }
    
}
