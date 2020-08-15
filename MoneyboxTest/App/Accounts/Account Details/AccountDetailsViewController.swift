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
    
    var accountDetailsPresenter: AccountDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        accountDetailsPresenter?.viewWillAppear()
    }
    
}

extension AccountDetailsViewController: AccountDetailsView {
    
    func setBackgroundColour(to colour: UIColor) {
        backgroundOverlayView.backgroundColor = colour
    }
    
}
