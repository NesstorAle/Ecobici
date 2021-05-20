//
//  Cordenates.swift
//  Ecobici
//
//  Created by Nestor A on 15/04/21.
//

import Foundation

struct Cordenates:Decodable {
    var network: Network
}

struct Network:Decodable {
    var stations:[Stations]
}

struct Stations:Decodable {
    var empty_slots: Int
    var free_bikes: Int
    var latitude: Double
    var longitude: Double
    var name: String
}
