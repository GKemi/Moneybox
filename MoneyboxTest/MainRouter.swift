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
            destinationViewController = LoginBuilder.build(with: self)
        case .accounts:
            destinationViewController = AccountsBuilder.build(with: self)
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
