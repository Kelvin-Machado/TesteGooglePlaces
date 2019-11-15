//
//  LocationViewControllerExFinalizeOrder.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 15/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension LocationViewController {
    func finalizeOrderPost(){
        
        let FinalizeOrder = [
            "store_latitude":storeCoords.storeLatitude!,
            "store_longitude":storeCoords.storeLongitude!,
            "user_latitude":userCoords.userLatitude!,
            "user_longitude":userCoords.userLongitude!,
            "card_number":CreditCardData.cardNumberRaw!,
            "cvv":CreditCardData.cvv!,
            "expiry_date":CreditCardData.expiryDate!,
            "value":OrderResume.price!
        ] as [String : Any]
        
        let parameters = try? JSONSerialization.data(withJSONObject: FinalizeOrder)
        
        let url = URL(string: "https://mdk3ljy26k.execute-api.sa-east-1.amazonaws.com/order")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = parameters

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Data not found")
                return
            }
            let FinalizeOrderResponse = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let FinalizeOrderResponse = FinalizeOrderResponse as? [String: Any] {
                print(FinalizeOrderResponse)
                MessageResponse.value = FinalizeOrderResponse["value"] as! Double? ?? 0.0
                MessageResponse.message = FinalizeOrderResponse["message"] as! String? ?? ""
            }
        }
        
    task.resume()

    }
    
}
