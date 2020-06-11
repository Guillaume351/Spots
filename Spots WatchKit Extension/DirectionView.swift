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
    
    
    
    init(locationManager : LocationManager,spot : Spot){
        self.locationManager = locationManager
        //let longLat = spot.components(separatedBy: ",")
        self.spot = spot //Spot(name:"Spot" + String(Int.random(in:1...100)), latitude: Double(longLat[0])!, longitude: Double(longLat[1])!)
        
    }
    
    
    func degreesToRadians(degrees: Double) -> Double { return degrees * .pi / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / .pi }
    
    func getBearingBetweenTwoPoints1(point1 : CLLocation, point2 : CLLocation) -> Double {
        
        let lat1 = degreesToRadians(degrees: point1.coordinate.latitude)
        let lon1 = degreesToRadians(degrees: point1.coordinate.longitude)
        
        let lat2 = degreesToRadians(degrees: point2.coordinate.latitude)
        let lon2 = degreesToRadians(degrees: point2.coordinate.longitude)
        
        let dLon = lon2 - lon1
        
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)
        
        return radiansToDegrees(radians: radiansBearing)
    }
    
    var isLookingInTheRightDirection = false
    var body: some View {
        
        
        let lat2 = self.spot.latitude
        let lon2 = self.spot.longitude
        
        var backgroundColor = Color.black
        var distance = locationManager.lastLocation?.distance(from: CLLocation(latitude: lat2, longitude: lon2)) ?? 0.0
        var unit = "m"
        var format = "%.0f"
        if (distance > 10000.0){
            unit = "km"
            distance = distance / 1000
            format = "%.3f"
        }else if distance <= 20 {
            backgroundColor = Color.green
            
        }
        let angle = (self.locationManager.degrees) + getBearingBetweenTwoPoints1(point1: locationManager.lastLocation!, point2: CLLocation(latitude: lat2, longitude: lon2))
        if(!isLookingInTheRightDirection && abs(angle) <= 8){
           // let generator = UINotificationFeedbackGenerator()
              //  generator.notificationOccurred(.success)
        }
        if(isLookingInTheRightDirection && abs(angle) > 8){
            
        }
        return VStack {
            HStack{
                Text(spot.name)
            }
            
            ZStack{
                Image("compass").resizable()
            }.rotationEffect(Angle(degrees:  angle))
            Text(String(format: format, distance) + " " + unit)
        }.background(backgroundColor)
        
        
    }
}

struct DirectionView_Previews: PreviewProvider {
    static var previews: some View {
        // DirectionView(locationManager : CLLocationManager(), spot:"1.23,1.23")
        Text("Preview : DirectionView")
        
    }
}
