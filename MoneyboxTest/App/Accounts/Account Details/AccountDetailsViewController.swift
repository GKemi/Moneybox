//
//  AccountDetailsViewController.swift
//  MoneyboxTest
//
//  Created by Work on 15/08/2020.
//

import UIKit

protocol AccountDetailsView: class {
    func setBackgroundColour(to colour: UIColor)
}

class AccountDetailsViewController: UIViewController {
    @IBOutlet weak var backgroundOverlayView: UIView!
    @IBOutlet weak var depositButton: UIButton!
    
    var accountDetailsPresenter: AccountDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
}
