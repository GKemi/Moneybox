//
//  AccountsViewController.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 12/08/2020.
//

import UIKit

protocol AccountsView: class {
    
}

class AccountsViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var totalPlanLabel: UILabel!
    @IBOutlet weak var accountsTableView: UITableView!
    
    var presenter: AccountsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewWillLoad()
    }

}

extension AccountsViewController: AccountsView {
    
}
