//
//  AccountDetailsViewController.swift
//  MoneyboxTest
//
//  Created by Work on 15/08/2020.
//

import UIKit

protocol AccountDetailsView: class {
    func setBackgroundColour(to colour: UIColor)
    func setAccountDetails(with viewModel: AccountDetailsViewModel)
}

class AccountDetailsViewController: UIViewController {
    @IBOutlet weak var backgroundOverlayView: UIView!
    @IBOutlet weak var depositButton: UIButton!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var planValueLabel: UILabel!
    @IBOutlet weak var moneyboxLabel: UILabel!
    
    var accountDetailsPresenter: AccountDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Individual Account"
        
        accountDetailsPresenter?.viewWillAppear()
    }
    
    @IBAction func depositButtonPressed(_ sender: Any) {
        accountDetailsPresenter?.depositButtonPressed()
    }
}

extension AccountDetailsViewController: AccountDetailsView {
    
    func setBackgroundColour(to colour: UIColor) {
        backgroundOverlayView.backgroundColor = colour
    }
    
    func setAccountDetails(with viewModel: AccountDetailsViewModel) {
        accountNameLabel.text = viewModel.name
        planValueLabel.text = "Plan value: \(viewModel.planValue)"
        moneyboxLabel.text = "Moneybox: \(viewModel.moneybox)"
    }
    
}
