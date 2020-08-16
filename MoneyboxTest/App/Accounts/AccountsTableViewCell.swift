//
//  AccountsTableViewCell.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 13/08/2020.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var planValueLabel: UILabel!
    @IBOutlet weak var moneyboxLabel: UILabel!

    @IBOutlet weak var cardView: UIView!
    
    func setCellContent(with viewModel: AccountViewModel) {
        self.selectionStyle = .none
        accountNameLabel.text = viewModel.name
        planValueLabel.text = "Plan value: \(viewModel.planValue)"
        moneyboxLabel.text = "Moneybox: \(viewModel.moneybox)"
        
        cardView.layer.cornerRadius = 15
        cardView.layer.masksToBounds = true
        cardView.backgroundColor = viewModel.colour
    }
}
