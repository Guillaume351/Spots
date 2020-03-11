//
//  ContentView.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 01/12/2019.
//  Copyright © 2019 Guillaume Claverie. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation


struct ContentView: View {
    //  @ObservedObject var locationManager2 = LocationManager()
    @ObservedObject var locationManager : LocationManager
    
    init(locationManager : LocationManager) {
        self.locationManager = locationManager
       
        // window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(Model()))
        
    }
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    
    // @State var spotName: String = "Spot"
    @State var textInput = "";
    @EnvironmentObject var model: Model
    var body: some View {
        
        return ScrollView{
            VStack{
                Text("Spots")
                
                Text("latitude: " + String(format: "%.5f", locationManager.lastLocation?.coordinate.latitude ?? 0))
                Text("longitude: " + String(format: "%.5f", locationManager.lastLocation?.coordinate.longitude ?? 0))
                // Text("angle : \(userCompassAngle)")
                Spacer()
                
                NavigationLink(destination: AddSpotView(latitude: self.userLatitude, longitude: self.userLongitude), isActive: self.$model.pushed ){
                    HStack{
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("Add")
                        
                    }
                }
                
                NavigationLink(destination: ListContentView(locationManager: self.locationManager)) {
                    
                    HStack{
                        Image(systemName: "list.dash")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("List")
                        
                    }
                    
                    
                }
            }.onAppear(){
                self.model.pushed = false
            }
            
        }
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Preview of ContentView")
        //ContentView(locationManager: LocationManager(), image: <#T##Image#>)
    }
}

struct defaultStorageKeys{
    static let spotsKey = "storeSpotsKey"
}

class Model: ObservableObject {
    @Published var pushed = false
}
