//
//  LoginViewPresenter.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 11/08/2020.
//

import Foundation

protocol LoginPresenter {
    func loginButtonPressed(with email: String?, and password: String?)
}

//set up network client to make a request to the authentication endpoint
//simply retrieve the result and print it in the presenter to start off

//parse the bearer token and store it in a 'usermanager' object

//when the parsing completes, tell the 'router' object to launch the second screen

class LoginViewPresenter: LoginPresenter {
    
    weak var loginView: LoginView?
    
    
    func loginButtonPressed(with email: String?, and password: String?) {
        guard let email = email, let password = password else { return }
        
        print("email: \(email) & pass: \(password)")
    }
    
    
}
