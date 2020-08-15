//
//  AccountsRouter.swift
//  MoneyboxTest
//
//  Created by Work on 15/08/2020.
//

import Foundation
import UIKit

class AccountsRouter {
    let mainRouter: MainRouter
    let navigationController: UINavigationController
    var account: Account?
    
    init(mainRouter: MainRouter, navigationController: UINavigationController) {
        self.mainRouter = mainRouter
        self.navigationController = navigationController
    }
    
    func prepareDetails(with account: Account) {
        self.account = account
    }

    func route(to destination: AccountsRouterDestination) {
        switch destination {
        case .accountDetails:
            let accountDetailsVC = AccountDetailsViewController(nibName: "AccountDetailsViewController", bundle: nil)
            let accountDetailsPresenter = AccountDetailsViewPresenter(account: self.account!)
            
            accountDetailsVC.accountDetailsPresenter = accountDetailsPresenter
            accountDetailsPresenter.accountDetailsView = accountDetailsVC
            
            navigationController.pushViewController(accountDetailsVC, animated: true)
        }
    }
    
}

enum AccountsRouterDestination {
    case accountDetails
}
