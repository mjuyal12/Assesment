//
//  Utility.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import UIKit
import SVProgressHUD

class Utility {
    
    /// Shows the alert
    static func showAlert(withTitle title: String?, andMessage message: String?, on controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    /// Shows the Loader
    static func showLoader(withMessage message: String?) {
        SVProgressHUD.show(withStatus: message)
    }
    
    /// Hides the loader
    static func hideLoader() {
        SVProgressHUD.dismiss()
    }
    
}
