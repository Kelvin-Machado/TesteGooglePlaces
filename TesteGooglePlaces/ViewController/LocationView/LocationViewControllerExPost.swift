//
//  LocationViewControllerExPost.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 12/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension LocationViewController {
    func checkoutPost(){
        
        let checkout = [
                "store_latitude":storeCoords.storeLatitude!,
                "store_longitude":storeCoords.storeLongitude!,
                "user_latitude":userCoords.userLatitude!,
                "user_longitude":userCoords.userLongitude!,
                "value":OrderResume.price!
            ] as [String : Any]
        
        let parameters = try? JSONSerialization.data(withJSONObject: checkout)
        
        let url = URL(string: "https://d9eqa4nu35.execute-api.sa-east-1.amazonaws.com/evaluate")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = parameters

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Data not found")
                return
            }
            let CheckoutResponse = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let CheckoutResponse = CheckoutResponse as? [String: Any] {
                print(CheckoutResponse)
                ValueResponse.distance = CheckoutResponse["distance"] as! Double? ?? 0.0
                ValueResponse.product_value = CheckoutResponse["product_value"] as! Double? ?? 0.0
                ValueResponse.total_value = CheckoutResponse["total_value"] as! Double? ?? 0.0
                ValueResponse.fee_value = CheckoutResponse["fee_value"] as! Double? ?? 0.0
            }
        }
        
    task.resume()

    }
    
}
