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
    
        let authNetworkClient = NetworkClient()
        let loginPresenter = LoginViewPresenter(router: router, networkClient: authNetworkClient)
        
        loginVC.loginPresenter = loginPresenter
        loginPresenter.loginView = loginVC
        
        return loginVC
    }
}
