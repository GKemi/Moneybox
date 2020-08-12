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

//  "Email": "test+ios@moneyboxapp.com"
//  "Password": "P455word12"

//parse the bearer token and store it in a 'usermanager' object

//when the parsing completes, tell the 'router' object to launch the second screen

class LoginViewPresenter: LoginPresenter {
    
    weak var loginView: LoginView?
    var networkClient: AuthNetworkClient
    var router: MainRouter
    
    init (router: MainRouter, networkClient: AuthNetworkClient) {
        self.router = router
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
        
        guard
            let data = networkClient.performSignIn(with: email, and: password),
            let json = try? JSONDecoder().decode(AuthenticationJSONResponse.self, from: data)
        else {
            print("Something has gone wrong, please try again later")
            return
        }
    
        router.route(to: .products)
    }
    
    
}
