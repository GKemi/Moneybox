//
//  AccountsViewPresenter.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 13/08/2020.
//

import Foundation
import UIKit

protocol AccountsPresenter {
    func viewWillAppear()
    func accountSelected(at index: Int)
}

class AccountsViewPresenter {
    weak var accountsView: AccountsView?
    var accountsInteractor: AccountsViewInteractor
    var accountsRouter: AccountsRouter
    var accountsCollection: AccountsCollection!
    
    init(accountsInteractor: AccountsViewInteractor,
         accountsRouter: AccountsRouter) {
        self.accountsInteractor = accountsInteractor
        self.accountsRouter = accountsRouter
    }
}

extension AccountsViewPresenter: AccountsPresenter {
    
    func viewWillAppear() {
        
        backgroundThread {
            self.accountsInteractor.fetchAccountsForUser(success: { accountsCollection in
                self.accountsView?.setTitle(to: "Hello \(UserStore.user!.email!)!")
                self.accountsCollection = accountsCollection
                
                self.accountsView?.setTotalPlanValue(to: accountsCollection.totalPlanValue.toGBPString)
                
                let viewModels = self.generateAccountViewModels()
                self.accountsView?.displayAccounts(with: viewModels)
            }, failure: {
                print("Unable to fetch accounts.")
            })
        }
        
    }
    
    func accountSelected(at index: Int) {
        accountsRouter.prepareDetails(with: accountsCollection.accounts[index])
        accountsRouter.route(to: .accountDetails)
    }
    
}

extension AccountsViewPresenter {
    
    private func generateAccountViewModels() -> [AccountViewModel] {
        var viewModels = [AccountViewModel]()
        
        for account in self.accountsCollection.accounts {
            let name = account.name
            let planValue = account.planValue.toGBPString
            let moneybox  = account.moneybox.toGBPString
            let accountColour = UIColor(hexString: account.colour, alpha: 0.35)
            
            let viewModel = AccountViewModel(name: name,
                             planValue: planValue,
                             moneybox: moneybox,
                             colour: accountColour)
            
            viewModels.append(viewModel)
        }
        
        return viewModels
    }
    
}
