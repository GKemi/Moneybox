//
//  AccountsViewPresenter.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 13/08/2020.
//

import Foundation

protocol AccountsPresenter {
    func viewWillLoad()
}

class AccountsViewPresenter {
    weak var accountsView: AccountsView?
    var networkClient: AccountsNetworkClient
    
    init(networkClient: AccountsNetworkClient) {
        self.networkClient = networkClient
    }
}

extension AccountsViewPresenter: AccountsPresenter {
    func viewWillLoad() {
        
        guard
            let data = networkClient.getAccounts(with: NetworkClient.bearerToken),
            let json = try? JSONDecoder().decode(AccountsJSONResponse.self, from: data)
        else { return }
        
        accountsView?.setTitle(to: "Hello friend!")
        accountsView?.setTotalPlanValue(to: "Total Plan Value: £\(json.totalValue)")
        
        var viewModels: [AccountViewModel] = []
        for productResponse in json.products {
            let name = productResponse.product.name
            let planValue = String(productResponse.planValue)
            let moneybox = String(productResponse.moneybox)
            
            let viewModel = AccountViewModel(name: name,
                             planValue: planValue,
                             moneybox: moneybox)
            
            viewModels.append(viewModel)
        }
        
        accountsView?.displayAccounts(with: viewModels)
    }
}
