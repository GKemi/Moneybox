//
//  AccountsBuilder.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 14/08/2020.
//

import Foundation
import UIKit

class AccountsBuilder {
    static func build(with router: MainRouter) -> UINavigationController {
        let accountsVC = AccountsViewController(nibName: "AccountsViewController", bundle: nil)
        let navController = UINavigationController()
        
        let accountsNetworkClient = NetworkClient()
        let accountsInteractor = AccountsViewInteractor(networkClient: accountsNetworkClient)
        let accountsRouter = AccountsRouter(mainRouter: router, navigationController: navController)
        let accountsPresenter = AccountsViewPresenter(accountsInteractor: accountsInteractor, accountsRouter: accountsRouter)
        
        accountsVC.presenter = accountsPresenter
        accountsPresenter.accountsView = accountsVC
        
        navController.pushViewController(accountsVC, animated: false)
        
        return navController
    }
}
