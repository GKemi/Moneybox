//
//  AccountsViewInteractor.swift
//  MoneyboxTest
//
//  Created by Work on 15/08/2020.
//

import Foundation

protocol AccountsInteractor {
    func fetchAccountsForUser(success: @escaping ([Account]) -> Void, failure: @escaping () -> Void)
}

class AccountsViewInteractor {
    let networkClient: AccountsNetworkClient
    
    init(networkClient: AccountsNetworkClient) {
        self.networkClient = networkClient
    }
}

extension AccountsViewInteractor: AccountsInteractor {
    func fetchAccountsForUser(success: @escaping ([Account]) -> Void, failure: @escaping () -> Void) {
        guard
            let bearerToken = UserStore.user?.bearer,
            let data = networkClient.getAccounts(with: bearerToken  ),
            let json = try? JSONDecoder().decode(AccountsJSONResponse.self, from: data)
        else {
            DispatchQueue.main.async {
                failure()
            }
            return
        }
    
        var accounts = [Account]()
        for product in json.products {
            let account = Account(name: product.product.name,
                                  planValue: product.planValue,
                                  moneybox: product.moneybox,
                                  colour: product.product.hexColour)
            accounts.append(account)
        }
        
        DispatchQueue.main.async {
            success(accounts)
        }
    }
}
