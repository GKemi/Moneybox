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

class LoginViewPresenter {
    weak var loginView: LoginView?
    
    let networkClient: LoginNetworkClient
    let loginInteractor: LoginInteractor
    let router: MainRouter
    
    init (router: MainRouter, networkClient: LoginNetworkClient, loginInteractor: LoginInteractor) {
        self.router = router
        self.loginInteractor = loginInteractor
        self.networkClient = networkClient
    }
    
}

extension LoginViewPresenter: LoginPresenter {
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
        
        DispatchQueue.global(qos: .background).async {
            self.loginInteractor.performSignIn(with: email, and: password) { user in
                guard
                    let user = user
                else {
                    print("Something has gone wrong, please try again later")
                    return
                }
                
                NetworkClient.bearerToken = user.bearer //replace with a call to router to prepare user object
                self.router.route(to: .accounts)
            }
        }

    }
}
