//
//  AccountsJSONResponse.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 13/08/2020.
//

import Foundation

struct AccountsJSONResponse: Decodable {
    let totalValue: Double
    let products: [ProductResponse]
    
    enum CodingKeys: String, CodingKey {
        case totalValue = "TotalPlanValue"
        case products = "ProductResponses"
    }
}

struct ProductResponse: Decodable {
    let planValue: Double
    let moneybox: Double
    let product: Product
    
    enum CodingKeys: String, CodingKey {
        case planValue = "PlanValue"
        case moneybox = "Moneybox"
        case product = "Product"
    }
}

struct Product: Decodable {
    let name: String
    let hexColour: String
    
    enum CodingKeys: String, CodingKey {
        case name = "FriendlyName"
        case hexColour = "ProductHexCode"
    }
}
