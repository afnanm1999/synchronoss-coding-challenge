//
//  Stations.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation

struct Station: XMLIndexerDeserializable {
    let stationId: Int
    let stationDesc: String
    let stationAlias: String
    let stationLatitude: Double
    let stationLongitude: Double
    let stationCode: String
    let stationDistance: String
    
    static func deserialize(_ node: XMLIndexer) throws -> Station {
        return try Station(
            stationId: node["StationId"].value(),
            stationDesc: node["StationDesc"].value(),
            stationAlias: node["StationAlias"].value(),
            stationLatitude: node["StationLatitude"].value(),
            stationLongitude: node["StationLongitude"].value(),
            stationCode: node["StationCode"].value(),
            stationDistance: ""
        )
    }
}
