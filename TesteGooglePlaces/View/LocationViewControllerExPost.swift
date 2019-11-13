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
        let parameters = checkout(
            store_latitude:storeCoords.self.storeLatitude,
            store_longitude:storeCoords.self.storeLongitude,
            user_latitude:userCoords.self.userLatitude,
            user_longitude:userCoords.self.userLongitude,
            value:OrderResume.self.price)
        
        
        print(parameters)
    }
    
}
