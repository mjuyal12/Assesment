//
//  LoginViewModel.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import Foundation

class LoginViewModel: ViewModel {
    
    var failure: ((String) -> Void)?
    var success: (() -> Void)?
    var coordinator: LoginCoordinator?
    
    /**Handle login to XMPP server*/
    func callLoginToXMPP(username: String?, password: String?) {
        if let username = username,
           let password = password, !username.isBlank(), !password.isBlank() {
            do {
                showLoader(withMessage: nil)
                try XMPPManager.shared.connectUsername(username, password: password, completion: { [weak self] (isAuthenticated) in
                    self?.hideLoader()
                    self?.coordinator?.moveToTab()
                })
            } catch {
                hideLoader()
                print(error.localizedDescription)
                failure?(error.localizedDescription)
            }
        } else {
            hideLoader()
            failure?("Fields cannot be empty")
        }
    }
    
}
