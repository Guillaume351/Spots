//
//  ContentView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 01/12/2019.
//  Copyright © 2019 Guillaume Claverie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            Button(action: {
                   print("Add button tapped!")
               }) {
                   Image(systemName: "plus.circle")
                       .font(.largeTitle)
                       .foregroundColor(.red)
               }
            Button(action: {
                print("List button tapped!")
            }){
                Image(systemName: "list.dash")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
        
        
        }

       
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
