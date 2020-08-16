//
//  AccountsViewController.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 12/08/2020.
//

import UIKit

protocol AccountsView: class {
    func setTitle(to title: String)
    func setTotalPlanValue(to: String)
    func displayAccounts(with viewModels: [AccountViewModel])
}

class AccountsViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var totalPlanLabel: UILabel!
    @IBOutlet weak var accountsTableView: UITableView!
    
    var presenter: AccountsPresenter?
    var accountViewModels = [AccountViewModel]() { didSet { accountsTableView.reloadData() }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "User Accounts"
        
        accountsTableView.dataSource = self
        accountsTableView.delegate = self
        accountsTableView.register(UINib(nibName: "AccountsTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "AccountsTableViewCell")
        accountsTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }

}

extension AccountsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountsTableViewCell") as! AccountsTableViewCell
        
        cell.setCellContent(with: accountViewModels[indexPath.row])
        
        return cell
    }
}

extension AccountsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.accountSelected(at: indexPath.row)
    }
}

extension AccountsViewController: AccountsView {
    func setTitle(to title: String) {
        helloLabel.text = title
    }
    
    func setTotalPlanValue(to value: String) {
        totalPlanLabel.text = "Total Plan Value: \(value)"
    }
    
    func displayAccounts(with viewModels: [AccountViewModel]) {
        accountViewModels = viewModels
    }
}
