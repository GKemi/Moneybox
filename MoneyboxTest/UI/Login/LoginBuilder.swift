//
//  LoginBuilder.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 14/08/2020.
//

import Foundation
import UIKit

class LoginBuilder {
    static func build(with router: MainRouter) -> UIViewController {
        let loginVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
    
        let loginNetworkClient = NetworkClient()
        let loginInteractor = LoginViewInteractor(networkClient: loginNetworkClient)
        let loginPresenter = LoginViewPresenter(router: router, networkClient: loginNetworkClient, loginInteractor: loginInteractor)
        
        loginVC.loginPresenter = loginPresenter
        loginPresenter.loginView = loginVC
        
        return loginVC
    }
}
