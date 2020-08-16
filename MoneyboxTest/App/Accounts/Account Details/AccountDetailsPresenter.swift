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
    
    var account: Account
    let accountDetailsInteractor: AccountDetailsInteractor
    
    init(account: Account, accountDetailsInteractor: AccountDetailsInteractor) {
        self.account = account
        self.accountDetailsInteractor = accountDetailsInteractor
    }
}

extension AccountDetailsViewPresenter: AccountDetailsPresenter {

    func viewWillAppear() {
        let colour = UIColor(hexString: account.colour, alpha: 0.35)
        accountDetailsView?.setBackgroundColour(to: colour)
        presentAccountDetails()
    }
    
    func depositButtonPressed() {
        backgroundThread {
            self.accountDetailsInteractor.depositMoney(amount: 10.0, for: self.account, success: { account in
                self.account = account
                self.presentAccountDetails()
            }, failure: {
                print("Sorry, we can't deposit any money at the moment. Please try again later.")
            })
        }
        
    }
}

extension AccountDetailsViewPresenter {
    private func presentAccountDetails() {
        let viewModel = AccountDetailsViewModel(name: account.name,
                                                planValue: account.planValue.toGBPString,
                                                moneybox: account.moneybox.toGBPString)
        accountDetailsView?.setAccountDetails(with: viewModel)
    }
}
