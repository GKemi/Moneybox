//
//  MockLoginInteractor.swift
//  LoginPresenterTests
//
//  Created by Work on 16/08/2020.
//

import Foundation
@testable import MoneyboxTest

class MockLoginInteractor: LoginInteractor {
    var signInWillSucceed = false
    
    func performSignIn(with email: String, and password: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        if signInWillSucceed {
            success()
        } else {
            failure()
        }
    }
}
