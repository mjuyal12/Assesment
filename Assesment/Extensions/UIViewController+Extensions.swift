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
    
    /**Show Alert on controller*/
    func showAlert(withTitle title: String?, andMessage message: String?, on queue: DispatchQueue = .main) {
        queue.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: AppStrings.ok.string, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
