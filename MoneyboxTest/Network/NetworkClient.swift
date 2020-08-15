//
//  NetworkClient.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 11/08/2020.
//

import Foundation

protocol LoginNetworkClient {
    func performSignIn(with email: String, and password: String) -> Data?
}

protocol AccountsNetworkClient {
    func getAccounts(with token: String) -> Data?
}

protocol AccountDetailsNetworkClient {
    func deposit(amount: Double, for accountID: Int, with token: String)
}

class NetworkClient {
    static var bearerToken: String = ""
}

extension NetworkClient: LoginNetworkClient {
    func performSignIn(with email: String, and password: String) -> Data? {
        guard let loginURL = loginURL else { return nil }
        var loginRequest = generateDefaultRequest(with: loginURL)
            
        loginRequest.httpMethod = "POST"
        let bodyParams: [String : String] = [
            "Email" : email,
            "Password" : password,
            "Idfa" : "ANYTHING"
        ]
        loginRequest.httpBody = try! JSONSerialization.data(withJSONObject: bodyParams, options: [])
        
        return perform(request: loginRequest)
    }
}

extension NetworkClient: AccountsNetworkClient {
    func getAccounts(with token: String) -> Data? {
        guard let investorURL = investorURL else { return nil }
        var investorRequest = generateDefaultRequest(with: investorURL)
        
        investorRequest.httpMethod = "GET"
        investorRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return perform(request: investorRequest)
    }
}

extension NetworkClient: AccountDetailsNetworkClient {
    
    func deposit(amount: Double, for accountID: Int, with token: String) {
        guard let depositURL = depositURL else { return }
        var depositRequest = generateDefaultRequest(with: depositURL)
        
        depositRequest.httpMethod = "POST"
        let bodyParams: [String : Any] = [
            "Amount" : amount,
            "InvestorProductId" : accountID
        ]
        depositRequest.httpBody = try! JSONSerialization.data(withJSONObject: bodyParams, options: [])
        depositRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        perform(request: depositRequest) //Responds with updated moneybox account, so consider using that to update the account entity
    }
    
    
}

extension NetworkClient {
    
    private var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api-test02.moneyboxapp.com"
        
        return components
    }
    
    private var loginURL: URL? {
        var loginComponents = baseURLComponents
        loginComponents.path = "/users/login"
        
        return loginComponents.url
    }
    
    private var investorURL: URL? {
        var investorComponents = baseURLComponents
        investorComponents.path = "/investorproducts"
        
        return investorComponents.url
    }
    
    private var depositURL: URL? {
        var depositComponents = baseURLComponents
        depositComponents.path = "/oneoffpayments"
        
        return depositComponents.url
    }
    
    private func generateDefaultRequest(with url: URL) -> URLRequest {
        var defaultRequest = URLRequest(url: url)
        defaultRequest.addValue("8cb2237d0679ca88db6464", forHTTPHeaderField: "AppId")
        defaultRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        defaultRequest.addValue("7.10.0", forHTTPHeaderField: "appVersion")
        defaultRequest.addValue("3.0.0", forHTTPHeaderField: "apiVersion")
        
        return defaultRequest
    }
    
    private func perform(request: URLRequest) -> Data? {
        let semaphore = DispatchSemaphore(value: 0)
        
        var resultData: Data?
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            resultData = data
            semaphore.signal()
        }.resume()
        
        _ = semaphore.wait(timeout: .now() + .seconds(5))
        
        return resultData
    }
}
