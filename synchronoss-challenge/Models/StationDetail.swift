//
//  StationDetail.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class StationDetail: NSObject {
    
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
    
    init(stationFullName: String?,
         trainCode: String?,
         queryTime: String?,
         origin: String?,
         destination: String?,
         status: String?,
         scheduledDepartTime: String?,
         scheduledArrivalTime: String?,
         direction: String?,
         trainType: String?,
         expectedDepartureTime: String?) {
        
        self.stationFullName = stationFullName
        self.trainCode = trainCode
        self.queryTime = queryTime
        self.origin = origin
        self.destination = destination
        self.status = status
        self.scheduledDepartTime = scheduledDepartTime
        self.scheduledArrivalTime = scheduledArrivalTime
        self.direction = direction
        self.trainType = trainType
        self.expectedDepartureTime = expectedDepartureTime
    }
    
}
