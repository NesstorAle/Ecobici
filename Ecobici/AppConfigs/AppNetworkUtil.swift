//
//  AppNetworkUtils.swift
//  Ecobici
//
//  Created by Nestor A on 15/04/21.
//

import Foundation

class AppNetworkUtil {
    var stations: [Stations] = []
    
    func requestEcobiciStations(url:String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJson(ecobiciData: safeData)
                }
            }
            task.resume()
        }
        
    }
    
    func parseJson(ecobiciData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(Cordenates.self, from: ecobiciData)
            print(decodeData.network.stations.count)
            decodeData.network.stations.forEach {sta in
                if sta.free_bikes != 0 {
                    stations.append(sta)
                }
            }
            print(stations.count)
        } catch {
            print (error)
        }
    }
    
}
