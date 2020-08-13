//
//  MainRouter.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 12/08/2020.
//

import Foundation
import UIKit

class MainRouter {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        route(to: .login)
    }
    
    func route(to destination: MainRouterDestination) {
        let destinationViewController: UIViewController
        
        switch destination {
        case .login:
            let loginVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        
            let authNetworkClient = NetworkClient()
            let loginPresenter = LoginViewPresenter(router: self, networkClient: authNetworkClient)
            
            loginVC.loginPresenter = loginPresenter
            loginPresenter.loginView = loginVC
            
            destinationViewController = loginVC
        case .accounts:
            let accountsVC = AccountsViewController(nibName: "AccountsViewController", bundle: nil)
            
            let accountsNetworkClient = NetworkClient()
            let accountsPresenter = AccountsViewPresenter(networkClient: accountsNetworkClient)
            
            accountsVC.presenter = accountsPresenter
            accountsPresenter.accountsView = accountsVC
            
            destinationViewController = accountsVC
        }
        
        window.rootViewController = destinationViewController
        window.makeKeyAndVisible()
        
        UIView.transition(with: window,
                          duration: 0.55,
                          options: UIView.AnimationOptions.transitionFlipFromLeft,
                          animations: {},
                          completion: nil)
    }
    
}

enum MainRouterDestination {
    case login
    case accounts
}
