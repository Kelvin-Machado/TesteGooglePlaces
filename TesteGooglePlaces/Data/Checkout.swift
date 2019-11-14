//
//  Checkout.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 10/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//


import UIKit

struct storeCoords {
    static var storeLatitude: String!
    static var storeLongitude: String!
}

struct userCoords {
    static var userLatitude: String!
    static var userLongitude: String!
}

extension LocationViewController {
    struct checkout: Encodable {
        var store_latitude: String!
        var store_longitude: String!
        var user_latitude: String!
        var user_longitude: String!
        var value: Double!
    }
}
