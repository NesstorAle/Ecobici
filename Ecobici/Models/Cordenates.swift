//
//  Cordenates.swift
//  Ecobici
//
//  Created by Nestor A on 15/04/21.
//

import Foundation

struct Cordenates:Decodable {
    let network: Network
}

struct Network:Decodable {
    let stations:[Stations]
}

struct Stations:Decodable {
    let empty_slots: Int
    let free_bikes: Int
    let latitude: Double
    let longitude: Double
    let name: String
}
