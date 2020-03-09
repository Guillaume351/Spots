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
    @ObservedObject var locationManager : LocationManager
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
   
 
    
    init(locationManager : LocationManager,spot : String){
        self.locationManager = locationManager
        let longLat = spot.components(separatedBy: ",")
        self.spot = Spot(name:"Spot" + String(Int.random(in:1...100)), latitude: Double(longLat[0])!, longitude: Double(longLat[1])!)
        
    }
     
    var body: some View {
        ZStack{
            Image("compass").resizable()
        }.rotationEffect(Angle(degrees: self.locationManager.degrees))
        
    }
}

struct DirectionView_Previews: PreviewProvider {
    static var previews: some View {
       // DirectionView(locationManager : CLLocationManager(), spot:"1.23,1.23")
        Text("Preview : DirectionView")
        
    }
}
