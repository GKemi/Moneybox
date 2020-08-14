//
//  LoginViewController.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 11/08/2020.
//

import UIKit

protocol LoginView: class {
    
}

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var loginPresenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        loginPresenter?.loginButtonPressed(with: emailField.text, and: passwordField.text)
    }
}

extension LoginViewController: LoginView {
    
}
