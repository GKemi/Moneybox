//
//  File.swift
//  MoneyboxTest
//
//  Created by Work on 16/08/2020.
//

import Foundation

protocol AccountDetailsInteractor {
    func depositMoney(amount: Double, for account: Account, success: @escaping (Account) -> Void, failure: @escaping () -> Void)
}

class AccountDetailsViewInteractor {
    let networkClient: AccountDetailsNetworkClient
    
    init(networkClient: AccountDetailsNetworkClient) {
        self.networkClient = networkClient
    }
}

extension AccountDetailsViewInteractor: AccountDetailsInteractor {
    
    func depositMoney(amount: Double, for account: Account, success: @escaping (Account) -> Void, failure: @escaping () -> Void) {
        guard
            let data = networkClient.deposit(amount: amount, for: account.accountID, with: UserStore.user!.bearer),
            let json = try? JSONDecoder().decode(AccountDepositJSONResponse.self, from: data)
        else {
            mainThread {
                failure()
            }
            return
        }
        
        let updatedAccount = Account(accountID: account.accountID,
                          name: account.name,
                          planValue: account.planValue,
                          moneybox: json.updatedMoneybox,
                          colour: account.colour)
        
        mainThread {
            success(updatedAccount)
        }
    }

}
