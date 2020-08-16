//
//  Double+GBPString.swift
//  MoneyboxTest
//
//  Created by Work on 16/08/2020.
//

import Foundation

extension Double {
    var toGBPString: String {
        return String(format: "£%.2f", self)
    }
}
