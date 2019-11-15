//
//  CreditCardData.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 14/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

struct CreditCardData {
    static var cardNumber:String!
    static var cardNumberRaw:String!
    static var cvv:Int!
    static var expiryDate:String!
    static var expiryDateRaw:String!
    static var holderName:String!
}
struct Keys {
    static let card_number  = "card_number"
    static let card_number_raw  = "card_number_raw"
    static let cvv = "cvv"
    static let expiry_date  = "expiry_date"
    static let expiry_date_raw  = "expiry_date_raw"
    static let holder_name = "holder_name"
}

extension CreditCardViewController {
    
    // Save Data
    func saveData() {
        defaults.set(CreditCardData.cardNumber, forKey: Keys.card_number)
        defaults.set(CreditCardData.cardNumberRaw, forKey: Keys.card_number_raw)
        defaults.set(CreditCardData.holderName, forKey: Keys.holder_name)
        defaults.set(CreditCardData.expiryDate, forKey: Keys.expiry_date)
        defaults.set(CreditCardData.expiryDateRaw, forKey: Keys.expiry_date_raw)
        defaults.set(CreditCardData.cvv, forKey: Keys.cvv)
        CreditCardViewController.existeCartao = true
    }

    // Check Save Data
     func checkForSavedData() {
        let card_number = defaults.value(forKey: Keys.card_number) as? String ?? ""
        credidCardNumberTxt.text = card_number
        CreditCardData.cardNumber = card_number
        
        let holder_name = defaults.value(forKey: Keys.holder_name) as? String ?? ""
        nameCreditCardTxt.text = holder_name
        CreditCardData.holderName = holder_name
        
        let expiry_date = defaults.value(forKey: Keys.expiry_date) as? String ?? ""
        expiryDateTxt.text = expiry_date
        CreditCardData.expiryDate = expiry_date
        
        let checkCvv = defaults.integer(forKey: Keys.cvv)
        cvvTxt.text = String(checkCvv)
        CreditCardData.cvv = checkCvv
        
        CreditCardViewController.existeCartao = true
        
        if  credidCardNumberTxt.text == "" || nameCreditCardTxt.text == "" || expiryDateTxt.text == "" || cvvTxt.text == "" {
            CreditCardViewController.existeCartao = false
        }
    }

}

