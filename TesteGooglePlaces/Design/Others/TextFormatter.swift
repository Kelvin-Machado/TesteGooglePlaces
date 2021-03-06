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

extension CreditCardViewController {
    
//    MARK: - Formats Credit Card Number
    func modifyCreditCardString(creditCardString : String) -> String {
        let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()
        CreditCardData.cardNumberRaw = trimmedString //save the raw Credit Card number
        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""
        var lastFourNumbers = "•••• •••• •••• "

        if(arrOfCharacters.count > 0) {
            for i in 0...arrOfCharacters.count-1 {
                modifiedCreditCardString.append(arrOfCharacters[i])
                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                    modifiedCreditCardString.append(" ")
                }
            }
            if (arrOfCharacters.count == 16) {
                           lastFourNumbers += String(arrOfCharacters[12]) +
                               String(arrOfCharacters[13]) +
                               String(arrOfCharacters[14]) +
                               String(arrOfCharacters[15])
                           CreditCardData.cardNumberLast = lastFourNumbers
            }
            if (arrOfCharacters.count < 16) {
                          lastFourNumbers = ""
                          CreditCardData.cardNumberLast = lastFourNumbers
           }
        }
        return modifiedCreditCardString
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         
        let newLength = (textField.text ?? "").count + string.count - range.length
        
//        Formats Credit Card Number Length
        if(textField == credidCardNumberTxt) {
             return newLength <= 19
         }
        
//        Formats Expiry Date
        if textField == expiryDateTxt {
            if expiryDateTxt.text?.count == 2 {
                
                if !(string == "") {
                    expiryDateTxt.text = expiryDateTxt.text! + "/"
                }
            }
            return !(textField.text!.count >= 5 && (string.count ) > range.length)
        }
        
//        Formats CVV
        if textField == cvvTxt {
            return newLength <= 3
        }
        
        else {
            
            return true
        }
    }
        
}

