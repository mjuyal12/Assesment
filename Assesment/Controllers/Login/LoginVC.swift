//
//  LoginVC.swift
//  Assesment
//
//  Created by Mayank Juyal on 20/02/21.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: LoginViewModel?
    
    var didTapLogin: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpHeader()
        configureVM()
        usernameTextField.text = "joiint-1@stun.joiint.com"
        passwordTextField.text = "joiint"
    }
    
    private func setUpHeader() {
        self.title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureVM() {
        viewModel?.failure = { [weak self] (message) in
            guard let strongSelf = self else {return}
            Utility.showAlert(withTitle: "Error", andMessage: message, on: strongSelf)
        }
    }
    
    @IBAction func clickedLogin(_ sender: UIButton) {
        viewModel?.callLoginToXMPP(username: usernameTextField.text, password: passwordTextField.text)
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
