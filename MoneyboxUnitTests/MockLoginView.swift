//
//  MockLoginView.swift
//  MoneyboxUnitTests
//
//  Created by Work on 16/08/2020.
//

import Foundation
@testable import MoneyboxTest

class MockLoginView: LoginView {
    var signInUnavailableMessageWillBeShown = false
    var failureMessage = ""
    
    func displaySignInUnavailableMessage(with message: String) {
        signInUnavailableMessageWillBeShown = true
        failureMessage = message
    }
    
}
