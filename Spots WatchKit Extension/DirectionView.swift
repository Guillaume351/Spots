//
//  DirectionView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 07/03/2020.
//  Copyright © 2020 Guillaume Claverie. All rights reserved.
//

import SwiftUI

struct DirectionView: View {
    
    var spot : Spot
    var locationManager : CLLocationManager
    init(locationManager : CLLocationManager,spot : Spot){
        self.locationManager = locationManager
        self.spot = spot
    }
    
    var body: some View {
        Image("compass").resizable().frame(width: 128, height: 128)
    }
}

struct DirectionView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionView(locationManager : CLLocationManager(), spot: Spot(name: "Test", latitude: 1.23, longitude: 1.23))
    }
}
