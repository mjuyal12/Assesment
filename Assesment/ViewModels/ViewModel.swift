//
//  ViewModel.swift
//  Assesment
//
//  Created by Mayank Juyal on 23/02/21.
//

import SVProgressHUD

/**Using to add some common functions*/
protocol ViewModel { }

extension ViewModel {
    
    /// Shows the Loader
    func showLoader(withMessage message: String?) {
        SVProgressHUD.show(withStatus: message)
    }
    
    /// Hides the loader
    func hideLoader() {
        SVProgressHUD.dismiss()
    }
    
}
