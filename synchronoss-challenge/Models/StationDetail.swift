//
//  StationDetail.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

struct StationDetail: XMLIndexerDeserializable {
    
    var stationFullName: String?
    var trainCode: String?
    var queryTime: String?
    var origin: String?
    var destination: String?
    var status: String?
    var scheduledDepartTime: String?
    var scheduledArrivalTime: String?
    var direction: String?
    var trainType: String?
    var expectedDepartureTime: String?
    
    static func deserialize(_ node: XMLIndexer) throws -> StationDetail {
        return try StationDetail(stationFullName: node["Stationfullname"].value(),
                                 trainCode: node["Traincode"].value(),
                                 queryTime: node["Querytime"].value(),
                                 origin: node["Origin"].value(),
                                 destination: node["Destination"].value(),
                                 status: node["Status"].value(),
                                 scheduledDepartTime: node["Schdepart"].value(),
                                 scheduledArrivalTime: node["Scharrival"].value(),
                                 direction: node["Direction"].value(),
                                 trainType: node["Traintype"].value(),
                                 expectedDepartureTime: node["Expdepart"].value())
    }
    
}
