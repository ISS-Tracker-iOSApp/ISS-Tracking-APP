//
//  IssAPI.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 16/11/21.
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
    var timestamp: Float
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


extension Date {
    func currentTimeMillis() -> Int64 {
           return Int64(self.timeIntervalSince1970)
       }
}

struct IssLocation: Codable {
    let name: String
    let id: Int
    let latitude, longitude, altitude, velocity: Double
    let visibility: String
    let footprint: Double
    let timestamp: Int
    let daynum, solar_lat, solar_lon: Double
    let units: String
}

extension IssLocation {
    func getCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    }
}




final class IssAPI {
    
    static let shared = IssAPI()
    
    
    
    
    func getTimestampsForCurrentOrbit() -> [Int64] {
        var timestamps = [Int64]()
        for x in 0..<11{
            let time = (Date() + Double(557 * x)).currentTimeMillis()
            timestamps.append(time)
        }
        return timestamps
    }
    
    
    
    ///Method that request datas from issAPI
    func request(completion: @escaping (Satellite) -> Void ) {
        let session = URLSession.shared
        let url = URL(string: "https://api.wheretheiss.at/v1/satellites/25544")
        guard let url = url else {return}

        let task = session.dataTask(with: url) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, error == nil else  {
                return
            }
        
            if response.statusCode == 200 {
                do {
                    guard let data = data else {
                        return
                    }
                    let datas = try JSONDecoder().decode(Satellite.self, from: data)
                    completion(datas)
                } catch {
                    print("Deu ruim")
                }
            } else {
                return
            }
        }
        task.resume()
    }
    
    func requestISSOrbit(completion: @escaping ([IssLocation]) -> Void) {
        let session = URLSession.shared
        let timeStamps = getTimestampsForCurrentOrbit()
        print(timeStamps)
        let url = URL(string: "https://api.wheretheiss.at/v1/satellites/25544/positions?timestamps=\(timeStamps[0]),\(timeStamps[1]),\(timeStamps[2]),\(timeStamps[3]),\(timeStamps[4]),\(timeStamps[5]),\(timeStamps[6]),\(timeStamps[7]),\(timeStamps[8]),\(timeStamps[9]),\(timeStamps[10])&units=kilometers")
        
        guard let url = url else {return}
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, error == nil else  {
                return
            }
            
            if response.statusCode == 200 {
                do {
                    guard let data = data else {
                        return
                    }
                    let datas = try JSONDecoder().decode([IssLocation].self, from: data)
                    completion(datas)
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                return
            }
        }
        task.resume()
    }


    
    
    
    
}
