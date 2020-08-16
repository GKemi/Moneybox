//
//  MoneyboxUnitTests.swift
//  MoneyboxUnitTests
//
//  Created by Work on 16/08/2020.
//

import XCTest
@testable import MoneyboxTest

class MoneyboxUnitTests: XCTestCase {

    func testLoginViewDisplaysErrorMessage_whenUserEntersIncompleteDetails() {
        let loginView = MockLoginView()
        let loginPresenter = LoginViewPresenter(router: MainRouter(window: UIWindow()), loginInteractor: MockLoginInteractor())
        loginPresenter.loginView = loginView
        
        //When presenter is given empty sign-in details
        loginPresenter.loginButtonPressed(with: "", and: "")
        
        //Then view should be called to display an error message
        XCTAssertEqual(loginView.failureMessage, "Please fill in the email and password fields to continue.")
    }
    
    func testLoginViewDisplaysErrorMessage_whenSignInFails() {
        let loginView = MockLoginView()
        let loginPresenter = LoginViewPresenter(router: MainRouter(window: UIWindow()), loginInteractor: MockLoginInteractor())
        loginPresenter.loginView = loginView
        
        //Given network client will return a nil data value
        
        //When presenter is given correct sign-in details
        loginPresenter.loginButtonPressed(with: "hello@gmail.com", and: "password")
        
        //Then view displays error message due to failed sign-in
        XCTAssertEqual(loginView.failureMessage, "Sorry, we couldn't sign you in at the moment. Please double-check your details and try again later.")
    }

}
