//
//  NetworkClient.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 11/08/2020.
//

import Foundation

protocol NetworkClient {
    func performSignIn(with email: String, and password: String) -> Data?
}

class AuthNetworkClient: NetworkClient {
    
    func performSignIn(with email: String, and password: String) -> Data? {
        return nil
    }
}
