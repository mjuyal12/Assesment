//
//  LoginViewModel.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import Foundation

class LoginViewModel {
    
    var failure: ((String) -> Void)?
    var success: (() -> Void)?
    var coordinator: LoginCoordinator?
    
    func callLoginToXMPP(username: String?, password: String?) {
        if let username = username,
           let password = password, !username.isBlank(), !password.isBlank() {
            do {
                Utility.showLoader(withMessage: nil)

                try XMPPManager.shared.connectUsername(username, password: password, completion: { [weak self] (isAuthenticated) in
                    Utility.hideLoader()
                    self?.coordinator?.moveToTab()
                })
            } catch {
                Utility.hideLoader()

                print(error.localizedDescription)
                failure?(error.localizedDescription)
            }
        } else {
            Utility.hideLoader()

            failure?("Fields cannot be empty")
        }
    }
    
}
