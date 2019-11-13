//
//  TextFormatter.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 10/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension String {

//     formats text for currency textField
    func currencyInputFormatting() -> String {

        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "R$ "
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        var amountWithPrefix = self

        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

        let double = (amountWithPrefix as NSString).doubleValue
        
        number = NSNumber(value: (double / 100))
        
        // save the raw value of amount
        OrderResume.price = double / 100

        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }
}
