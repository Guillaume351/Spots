//
//  EditSpotsView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 13/03/2020.
//  Copyright © 2020 Guillaume Claverie. All rights reserved.
//

import SwiftUI

struct EditSpotsView: View {
    @State private var showingAlert = false
    var body: some View {
        var allValues = ""
        let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: defaultStorageKeys.spotsKey) {
            print(stringOne) // Some String Value
            allValues = stringOne
            
            
            
            
        }
        
        var array = allValues.components(separatedBy: ";")
        
        var allSpots = [Spot]()
        
        var i = 0
        for spot in array {
            if(spot.count > 1){
                
                i+=1
                let longLat = spot.components(separatedBy: ",")
                if(longLat.count == 2){
                    allSpots.append(Spot(name:"\(i)", latitude: Double(longLat[0])!, longitude: Double(longLat[1])!))
                }else{
                    allSpots.append(Spot(name:longLat[0], latitude: Double(longLat[1])!, longitude: Double(longLat[2])!))
                }
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
                        Button(action: {
                            deleteSpot(spot: spot)
                            self.showingAlert = true
                        }) {
                            HStack{
                                Text(spot.name)
                                Image(systemName: "trash")
                            }
                            
                        }
                        .alert(isPresented: self.$showingAlert) {
                            Alert(title: Text("Success"), message: Text("The spot has been deleted. Please go back to the main screen"), dismissButton: .default(Text("OK")))
                        }
                        
                        
                        
                        
                        
                    }
                }
            }
        }
    }
}

func deleteSpot(spot : Spot){
    var allValues = ""
    let defaults = UserDefaults.standard
    if let stringOne = defaults.string(forKey: defaultStorageKeys.spotsKey) {
        print(stringOne) // Some String Value
        allValues = stringOne
        
        
        
        
    }else{
        allValues = "0,0"
        
    }
    
    allValues = allValues.replacingOccurrences(of: spot.name + "," + String(spot.latitude) + "," + String(spot.longitude) + ";", with: "")
    defaults.set(allValues, forKey: defaultStorageKeys.spotsKey)
    
    
    
}

struct EditSpotsView_Previews: PreviewProvider {
    static var previews: some View {
        EditSpotsView()
    }
}
