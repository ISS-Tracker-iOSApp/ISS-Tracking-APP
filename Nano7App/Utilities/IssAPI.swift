//
//  IssAPI.swift
//  Nano7App
//
//  Created by Igor Samoel da Silva on 16/11/21.
//
import Foundation
import CoreLocation

final class IssAPI {
    
    static let shared = IssAPI()
    
    
    private func getTimestampsForCurrentOrbit() -> [Int64] {
        var timestamps = [Int64]()
        for x in 0..<11{
            let time = (Date() + Double(557 * x)).currentTimeMillis()
            timestamps.append(time)
        }
        return timestamps
    }

    ///Method that request datas from issAPI
    func request(completion: @escaping (ISS) -> Void ) {
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
                    let datas = try JSONDecoder().decode(ISS.self, from: data)
                    completion(datas)
                } catch {
                    print("Error")
                    return
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
                    return
                }
            } else {
                return
            }
        }
        task.resume()
    }
    
    
    
    
    
    
}
