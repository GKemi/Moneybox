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
    
//    "Email": "test+ios@moneyboxapp.com",
//      "Password": "P455word12",
//      "Idfa": "ANYTHING"
//    AppId    8cb2237d0679ca88db6464
//    Content-Type    application/json
//    appVersion    7.10.0
//    apiVersion    3.0.0
    
    func performSignIn(with email: String, and password: String) -> Data? {
        guard let authURL = loginURL else { return nil }
        var authRequest = URLRequest(url: authURL)
        authRequest.addValue("8cb2237d0679ca88db6464", forHTTPHeaderField: "AppId")
        authRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        authRequest.addValue("7.10.0", forHTTPHeaderField: "appVersion")
        authRequest.addValue("3.0.0", forHTTPHeaderField: "apiVersion")
        
        authRequest.httpMethod = "POST"
        let bodyParams: [String: String] = [
            "Email" : email,
            "Password" : password,
            "Idfa" : "ANYTHING"
        ]
        authRequest.httpBody = try! JSONSerialization.data(withJSONObject: bodyParams, options: [])
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var resultData: Data?
        
        URLSession.shared.dataTask(with: authRequest) { data, _, _ in
            resultData = data
            semaphore.signal()
        }.resume()
        
        _ = semaphore.wait(timeout: .now() + .seconds(5))
        
        return resultData
    }
}

extension AuthNetworkClient {
    
    var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api-test02.moneyboxapp.com"
        
        return components
    }
    
    var loginURL: URL? {
        var loginComponents = baseURLComponents
        loginComponents.path = "/users/login"
        
        return loginComponents.url
    }
}
