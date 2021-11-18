//
//  IssLocation.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 18/11/21.
//

import Foundation
import CoreLocation
struct IssLocation: Codable {
    let name: String
    let id: Int
    let latitude, longitude, altitude, velocity: Double
    let visibility: String
    let footprint: Double
    let timestamp: Int64
    let daynum, solar_lat, solar_lon: Double
    let units: String
}

extension IssLocation {
    func getCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    }
}
