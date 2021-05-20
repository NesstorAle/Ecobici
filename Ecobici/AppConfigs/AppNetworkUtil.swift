//
//  AppNetworkUtils.swift
//  Ecobici
//
//  Created by Nestor A on 15/04/21.
//

import Foundation
import UIKit

class AppNetworkUtil {
    
    func requestEcobiciStations(completionHandler: @escaping (Cordenates) -> Void) {
        if let url = URL(string: AppConstant.API_BASE + AppConstant.END_POINT_ECOBICI) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                guard let safeData = data else { return }
                
                do {
                    let decodeData = try JSONDecoder().decode(Cordenates.self, from: safeData)
                    completionHandler(decodeData)
                } catch {
                    print (error)
                }
            }
            task.resume()
        }
    }
}
