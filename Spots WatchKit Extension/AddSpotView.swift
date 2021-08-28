//
//  AddSpotView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 09/03/2020.
//  Copyright © 2020 Guillaume Claverie. All rights reserved.
//

import SwiftUI

struct AddSpotView: View {
    @ObservedObject var model: Model
    @State var name = "Spot"
    
    let userLatitude, userLongitude : String
    
    
    init(latitude : String, longitude : String, model : Model) {
        self.userLatitude = latitude
        self.userLongitude = longitude
        self.model = model
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Enter a name")
                TextField("Name", text: $name)
                Button(action: {
                   
                    let defaults = UserDefaults.standard
                    if let stringOne = defaults.string(forKey: defaultStorageKeys.spotsKey) {
                        print(stringOne) // Some String Value
                        let text = stringOne + self.name + "," + (self.userLatitude) + "," + (self.userLongitude) + ";"
                        defaults.set(text, forKey: defaultStorageKeys.spotsKey)
                    }else{
                        defaults.set(self.name + "," + (self.userLatitude) + "," + (self.userLongitude) + ";", forKey: defaultStorageKeys.spotsKey)
                    }
                    self.name = self.name.replacingOccurrences(of: ",", with: " ")
                    self.name = self.name.replacingOccurrences(of: ";", with: " ")
                    self.model.pushed = false// Leave add mode
                   
                }) {
                    Text("Confirm")
                }
                Button(action: {
                    
                }) {
                    Text("Cancel")
                }
                
                
            }
            
        }
        
        
    }
}

struct AddSpotView_Previews: PreviewProvider {
    static var previews: some View {
        //AddSpotView()
        Text("AddSpotView Preview")
    }
}
