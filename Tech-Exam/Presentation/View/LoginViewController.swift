//
//  ViewController.swift
//  Tech-Exam
//
//  Created by Mark Angelo Noquera on 7/11/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    private let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordTextField.isSecureTextEntry = true
        
        self.usernameTextField.text = self.loginViewModel.username
        self.passwordTextField.text = self.loginViewModel.password
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let homeViewController = HomeViewController.instantiate(appStoryboard: .main)
        self.navigationController?.pushViewController(homeViewController,
                                                      animated: true)
    }
}

