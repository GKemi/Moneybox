//
//  AccountsViewPresenter.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 13/08/2020.
//

import Foundation
import UIKit

protocol AccountsPresenter {
    func viewDidLoad()
    func accountSelected(at index: Int)
}

class AccountsViewPresenter {
    weak var accountsView: AccountsView?
    var accountsInteractor: AccountsViewInteractor
    var accountsRouter: AccountsRouter
    var accounts = [Account]() //Consider creating an AccountManager class–of sorts–to keep track of accounts (and also hold total plan value from the network)
    
    init(accountsInteractor: AccountsViewInteractor,
         accountsRouter: AccountsRouter) {
        self.accountsInteractor = accountsInteractor
        self.accountsRouter = accountsRouter
    }
}

extension AccountsViewPresenter: AccountsPresenter {
    
    func viewDidLoad() {
        
        DispatchQueue.global(qos: .background).async {
            self.accountsInteractor.fetchAccountsForUser(success: { accounts in
                self.accountsView?.setTitle(to: "Hello \(UserStore.user!.email!)!")
                self.accounts = accounts
                
                let viewModels = self.generateAccountViewModels()
                let totalPlanValue = self.calculateTotalPlanValue()
                 
                self.accountsView?.setTotalPlanValue(to: "£\(totalPlanValue)")
                self.accountsView?.displayAccounts(with: viewModels)
            }, failure: {
                print("Unable to fetch accounts.")
            })
        }
        
    }
    
    func accountSelected(at index: Int) {
        accountsRouter.prepareDetails(with: accounts[index])
        accountsRouter.route(to: .accountDetails)
    }
    
}

extension AccountsViewPresenter {
    
    private func generateAccountViewModels() -> [AccountViewModel] {
        var viewModels = [AccountViewModel]()
        
        for account in self.accounts {
            let name = account.name
            let planValue = "£\(account.planValue)"
            let moneybox = "£\(account.moneybox)"
            let accountColour = UIColor(hexString: account.colour, alpha: 0.35)
            
            let viewModel = AccountViewModel(name: name,
                             planValue: planValue,
                             moneybox: moneybox,
                             colour: accountColour)
            
            viewModels.append(viewModel)
        }
        
        return viewModels
    }
    
    private func calculateTotalPlanValue() -> Double {
        var total: Double = 0
        
        for account in self.accounts {
            total += account.planValue
        }
        
        return total
    }
    
}
