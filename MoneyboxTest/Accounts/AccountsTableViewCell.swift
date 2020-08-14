//
//  AccountsTableViewCell.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 13/08/2020.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {
    @IBOutlet weak var accountNameLabel: UILabel!

    func setCellContent(with viewModel: AccountViewModel) {
        accountNameLabel.text = viewModel.name
    }
}
