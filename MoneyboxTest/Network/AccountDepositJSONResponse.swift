//
//  AccountDepositJSONResponse.swift
//  MoneyboxTest
//
//  Created by Work on 16/08/2020.
//

import Foundation

struct AccountDepositJSONResponse: Decodable {
    let updatedMoneybox: Double
    
    enum CodingKeys: String, CodingKey {
        case updatedMoneybox = "Moneybox"
    }
}
