//
//  IssAPI.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 16/11/21.
//
import Foundation

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



final class IssAPI {
    
    let shared = IssAPI()
    
    
    
    
    ///Method that request datas from issAPI 
    func request() {
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
                    print(datas)
                } catch {
                    print("Deu ruim")
                }
            } else {
                return
            }
        }
        task.resume()
    }
    
}
