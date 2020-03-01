//
//  ContentView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 01/12/2019.
//  Copyright © 2019 Guillaume Claverie. All rights reserved.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    
    var body: some View {

        
        VStack{
            Text("Spots")
            
            Text("latitude: \(userLatitude)")
            Text("longitude: \(userLongitude)")
            Spacer()
            Button(action: {
                   print("Add button tapped!")
                    let defaults = UserDefaults.standard
                    if let stringOne = defaults.string(forKey: defaultStorageKeys.spotsKey) {
                        print(stringOne) // Some String Value
                        defaults.set(stringOne + ";" + self.userLatitude + "," + self.userLongitude, forKey: defaultStorageKeys.spotsKey)
                    }else{
                        defaults.set(self.userLatitude + "," + self.userLongitude, forKey: defaultStorageKeys.spotsKey)
                    }
                
                
               }) {
                HStack{
                    Image(systemName: "plus.circle")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    Text("Ajouter")
                }
                   
               }
              NavigationLink(destination: ListContentView()) {
                              HStack{
                                  HStack{
                                                     Image(systemName: "list.dash")
                                                                       .font(.largeTitle)
                                                                       .foregroundColor(.red)
                                                     Text("Afficher")
                                                 }
                              }
                              
                          }
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct defaultStorageKeys{
    static let spotsKey = "storeSpotsKey"
}
