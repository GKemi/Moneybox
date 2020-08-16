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
    
    let loginInteractor: LoginInteractor
    let router: MainRouter
    
    init (router: MainRouter, loginInteractor: LoginInteractor) {
        self.router = router
        self.loginInteractor = loginInteractor
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
            loginView?.displaySignInUnavailableMessage(with: "Please fill in the email and password fields to continue.")
            return
        }
        
        loginInteractor.performSignIn(with: email, and: password,
        success: {
            self.router.route(to: .accounts)
        }) {
            self.loginView?.displaySignInUnavailableMessage(with: "Sorry, we couldn't sign you in at the moment. Please double-check your details and try again later.")
        }
    }
}

