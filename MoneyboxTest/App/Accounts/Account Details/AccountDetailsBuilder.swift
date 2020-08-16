//
//  AccountDetailsBuilder.swift
//  MoneyboxTest
//
//  Created by Work on 16/08/2020.
//

import Foundation
import UIKit

class AccountDetailsBuilder {
    static func build(with account: Account) -> UIViewController {
        let accountDetailsVC = AccountDetailsViewController(nibName: "AccountDetailsViewController", bundle: nil)
        
        let accountDetailsNetworkClient = NetworkClient()
        let accountDetailsInteractor = AccountDetailsViewInteractor(networkClient: accountDetailsNetworkClient)
        let accountDetailsPresenter = AccountDetailsViewPresenter(account: account, accountDetailsInteractor: accountDetailsInteractor)
        
        accountDetailsVC.accountDetailsPresenter = accountDetailsPresenter
        accountDetailsPresenter.accountDetailsView = accountDetailsVC
        
        return accountDetailsVC
    }
}
