//
//  Utility.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import UIKit
import SVProgressHUD

class Utility {
    
    static func showAlert(withTitle title: String?, andMessage message: String?, on controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    static func showLoader(withMessage message: String?) {
        SVProgressHUD.show(withStatus: message)
    }
    
    static func hideLoader() {
        SVProgressHUD.dismiss()
    }
    
}
