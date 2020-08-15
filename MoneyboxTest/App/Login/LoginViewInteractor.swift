//
//  LoginViewInteractor.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 14/08/2020.
//

import Foundation

protocol LoginInteractor {
    func performSignIn(with email: String, and password: String, success: @escaping () -> Void, failure: @escaping () -> Void)
}

class LoginViewInteractor {
    let networkClient: LoginNetworkClient
    
    init(networkClient: LoginNetworkClient) {
        self.networkClient = networkClient
    }
}

extension LoginViewInteractor: LoginInteractor {
    func performSignIn(with email: String, and password: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        guard
            let data = networkClient.performSignIn(with: email, and: password),
            let json = try? JSONDecoder().decode(AuthenticationJSONResponse.self, from: data)
        else {
            DispatchQueue.main.async {
               failure()
            }
            return
        }
        
        UserStore.user = User(email: email, bearer: json.session.bearer)
        
        DispatchQueue.main.async {
            success()
        }
    }
}