//
//  LoginViewInteractor.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 14/08/2020.
//

import Foundation

protocol LoginInteractor {
    func performSignIn(with email: String, and password: String, completion: @escaping (User?) -> Void)
}

class LoginViewInteractor {
    let networkClient: LoginNetworkClient
    
    init(networkClient: LoginNetworkClient) {
        self.networkClient = networkClient
    }
}

extension LoginViewInteractor: LoginInteractor {
    func performSignIn(with email: String, and password: String, completion: @escaping (User?) -> Void) {
        guard
            let data = networkClient.performSignIn(with: email, and: password),
            let json = try? JSONDecoder().decode(AuthenticationJSONResponse.self, from: data)
        else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        let user = User(email: email, bearer: json.session.bearer)
        
        DispatchQueue.main.async {
            completion(user)            
        }
    }
}
