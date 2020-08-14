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
        let accountsPresenter = AccountsViewPresenter(networkClient: accountsNetworkClient)
        
        accountsVC.presenter = accountsPresenter
        accountsPresenter.accountsView = accountsVC
        
        navController.pushViewController(accountsVC, animated: false)
        
        return navController
    }
}
