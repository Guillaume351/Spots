//
//  HostingController.swift
//  Spots WatchKit Extension
//
//  Created by Guillaume Claverie on 01/12/2019.
//  Copyright © 2019 Guillaume Claverie. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<AnyView>, CLLocationManagerDelegate {
    var locationManager = LocationManager()
    
    override var body: AnyView {
        let contentView = ContentView(locationManager: self.locationManager).environmentObject(Model())
        return AnyView(contentView)
    }
    

}
