//
//  Satellite.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 19/11/21.
//

import Foundation
import CoreLocation

protocol Satellite: Codable {
    var name: String {get set}
    var id: Int {get set}
    var latitude: Double {get set}
    var longitude: Double {get set}
    var altitude: Double {get set}
    var velocity: Double {get set}
    var visibility: String {get set}
    var footprint: Double {get set}
    var timestamp: Int64 {get set}
    var daynum: Double {get set}
    var solar_lat: Double {get set}
    var solar_lon: Double {get set}
    var units: String {get set}
    
    func getCoordinate() -> CLLocationCoordinate2D
}

extension Satellite {
    func getCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    }
}
