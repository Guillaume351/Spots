//
//  Spot.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 07/03/2020.
//  Copyright © 2020 Guillaume Claverie. All rights reserved.
//

import Foundation

struct Spot : Hashable, Codable{
    
    var name : String
    var latitude : Double
    var longitude : Double
    
    init(name : String, latitude : Double, longitude : Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
    
}
