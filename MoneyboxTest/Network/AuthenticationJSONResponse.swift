//
//  AuthenticationJSONResponse.swift
//  MoneyboxTest
//
//  Created by Gil Hakemi on 12/08/2020.
//

import Foundation

struct AuthenticationJSONResponse: Decodable {
    let session: Session
    
    enum CodingKeys: String, CodingKey {
        case session = "Session"
    }
}

struct Session: Decodable {
    let bearer: String
    
    enum CodingKeys: String, CodingKey {
        case bearer = "BearerToken"
    }
}
