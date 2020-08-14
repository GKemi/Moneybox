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

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
            let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let scanner = Scanner(string: hexString)
            if (hexString.hasPrefix("#")) {
                scanner.scanLocation = 1
            }
            var color: UInt32 = 0
            scanner.scanHexInt32(&color)
            let mask = 0x000000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
