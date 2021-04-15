//
//  Stations.swift
//  Ecobici
//
//  Created by Nestor A on 15/04/21.
//

import Foundation

class Station {
    let name: String
    let lon: Double
    let lat: Double
    let freeBikes: Int
    let emptySlots: Int
    
    init(name: String, lon: Double, lat: Double, freebikes: Int, emptySlots: Int) {
        self.name = name
        self.lon = lon
        self.lat = lat
        self.freeBikes = freebikes
        self.emptySlots = emptySlots
    }
}
