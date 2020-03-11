//
//  ListContentView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 08/12/2019.
//  Copyright © 2019 Guillaume Claverie. All rights reserved.
//

import SwiftUI

struct ListContentView: View {
    
    var locationManager : LocationManager
    
    init(locationManager : LocationManager) {
        self.locationManager = locationManager
    }
    
    var body: some View {
        
        var allValues = ""
        let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: defaultStorageKeys.spotsKey) {
            print(stringOne) // Some String Value
            allValues = stringOne
            
            
            
            
        }else{
            allValues = "0,0"
            
        }
        
        let array = allValues.components(separatedBy: ";")
        var allSpots = [Spot]()
        
        var i = 0
        for spot in array {
            i+=1
            let longLat = spot.components(separatedBy: ",")
            if(longLat.count == 2){
                allSpots.append(Spot(name:"\(i)", latitude: Double(longLat[0])!, longitude: Double(longLat[1])!))
            }else{
                allSpots.append(Spot(name:longLat[0], latitude: Double(longLat[1])!, longitude: Double(longLat[2])!))
            }
        }
        
        
        var spotsArray = [[String]]()
        for spot in allSpots {
            spotsArray.append([spot.name, String(spot.latitude), String(spot.longitude)])
        }
        
        
        
        
        return ScrollView{
            
            VStack {
                
                ForEach (allSpots, id: \.self) { spot in
                    
                    Group{
                        NavigationLink(destination: DirectionView(locationManager: self.locationManager,spot: spot)){
                            
                            Text(spot.name)
                            
                            
                        }
                    }
                }
            }
            
        }
        
        
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ListContentView(locationManager: CLLocationManager())
        Text("Preview of ListContentView")
    }
}
