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
    var networkClient: NetworkClient
    
    init (networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    
    func loginButtonPressed(with email: String?, and password: String?) {
        guard
            let email = email,
            let password = password,
            !email.isEmpty,
            !password.isEmpty
        else {
            print("Please fill in some sign in details")
            return
        }
        
        guard let data = networkClient.performSignIn(with: email, and: password) else {
            print("Something has gone wrong, please try again later")
            return
        }
        
        print(String(data: data, encoding: .utf8)!)
    }
    
    
}
