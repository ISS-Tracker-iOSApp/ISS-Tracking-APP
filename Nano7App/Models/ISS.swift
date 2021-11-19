//
//  Satellite.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 18/11/21.
//

import Foundation
import CoreLocation

struct ISS: Satellite {
    var name: String
    
    var id: Int
    
    var latitude: Double
    
    var longitude: Double
    
    var altitude: Double
    
    var velocity: Double
    
    var visibility: String
    
    var footprint: Double
    
    var timestamp: Int64
    
    var daynum: Double
    
    var solar_lat: Double
    
    var solar_lon: Double
    
    var units: String
    
    
}

