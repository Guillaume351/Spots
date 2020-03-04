//
//  ListContentView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 08/12/2019.
//  Copyright © 2019 Guillaume Claverie. All rights reserved.
//

import SwiftUI

struct ListContentView: View {
    var body: some View {
        
        var allValues = ""
        let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: defaultStorageKeys.spotsKey) {
            print(stringOne) // Some String Value
            allValues = stringOne
            
            
            
            
        }else{
            allValues = "Add a spot first!"
            
        }
        
        let array = allValues.components(separatedBy: ";")
        print(array) // returns ["1", "2", "3"]
        
        
        return ScrollView{
            
            VStack {
                
                ForEach(array, id: \.self) { spot in
                    Button(action: {
                        print("Spot button tapped!")
                    }){
                        Text("Spot ")
                    }
                }
            }
            
        }
        
        
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView()
    }
}
