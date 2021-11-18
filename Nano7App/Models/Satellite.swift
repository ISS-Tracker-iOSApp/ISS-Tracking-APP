//
//  Satellite.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 18/11/21.
//

import Foundation
import CoreLocation
struct Satellite: Decodable{
    var name: String
    var id: Int
    var latitude: Float
    var longitude: Float
    var altitude: Float
    var velocity: Float
    var visibility: String
    var footprint: Float
    var timestamp: Int64
    var daynum: Float
    var solar_lat: Float
    var solar_lon: Float
    var units: String
}

extension Satellite {
    func getCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    }
}
