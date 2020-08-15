//
//  AccountDetailsPresenter.swift
//  MoneyboxTest
//
//  Created by Work on 15/08/2020.
//

import Foundation
import UIKit

protocol AccountDetailsPresenter {
    func viewWillAppear()
    func depositButtonPressed()
}

class AccountDetailsViewPresenter {
    weak var accountDetailsView: AccountDetailsView?
    
    let account: Account
    let accountDetailsNetworkClient: AccountDetailsNetworkClient
    
    init(account: Account, accountDetailsNetworkClient: AccountDetailsNetworkClient) {
        self.account = account
        self.accountDetailsNetworkClient = accountDetailsNetworkClient
    }
}

extension AccountDetailsViewPresenter: AccountDetailsPresenter {

    func viewWillAppear() {
        let colour = UIColor(hexString: account.colour, alpha: 0.35)
        accountDetailsView?.setBackgroundColour(to: colour)
    }
    
    func depositButtonPressed() {
        accountDetailsNetworkClient.deposit(amount: 10.0, for: account.accountID, with: UserStore.user!.bearer)
    }
}
