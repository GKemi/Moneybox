//
//  LoginPresenterTests.swift
//  LoginPresenterTests
//
//  Created by Work on 16/08/2020.
//

import XCTest
@testable import MoneyboxTest

class LoginPresenterTests: XCTestCase {
    var loginView: MockLoginView!
    var loginInteractor: MockLoginInteractor!
    var loginPresenter: LoginViewPresenter!
    
    override func setUp() {
        loginView = MockLoginView()
        loginInteractor = MockLoginInteractor()
        loginPresenter = LoginViewPresenter(router: MainRouter(window: UIWindow()), loginInteractor: loginInteractor)
        loginPresenter.loginView = loginView
    }

    func testLoginViewDisplaysErrorMessage_whenUserEntersIncompleteDetails() {
        
        //When presenter is given empty sign-in details
        loginPresenter.loginButtonPressed(with: "", and: "")
        
        //Then view should be called to display an error message
        XCTAssertEqual(loginView.failureMessage, "Please fill in the email and password fields to continue.")
    }
    
    func testLoginViewDisplaysErrorMessage_whenSignInFails() {
        //Given interactor is set to invoke sign-in failure
        loginInteractor.signInWillSucceed = false
        
        //When presenter is given correct sign-in details
        loginPresenter.loginButtonPressed(with: "hello@gmail.com", and: "password")
        
        //Then view displays error message due to failed sign-in
        XCTAssertEqual(loginView.failureMessage, "Sorry, we couldn't sign you in at the moment. Please double-check your details and try again later.")
    }
    
    
}
