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
}

class AccountDetailsViewPresenter {
    weak var accountDetailsView: AccountDetailsView?
    
    let account: Account
    
    init(account: Account) {
        self.account = account
    }
}

extension AccountDetailsViewPresenter: AccountDetailsPresenter {
    func viewWillAppear() {
        let colour = UIColor(hexString: account.colour, alpha: 0.35)
        accountDetailsView?.setBackgroundColour(to: colour)
    }
}
