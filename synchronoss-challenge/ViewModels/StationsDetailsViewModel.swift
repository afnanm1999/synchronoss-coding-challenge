//
//  StationsDetailsViewModel.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

class StationsDetailViewModel {
    
    // MARK: - Properties
    var station: Station?
    var stationsDetailItems: [StationDetail]
    
    // MARK: - Initializer
    init() {
        station = nil
        stationsDetailItems = [StationDetail]()
    }
    
    // MARK: - Public Functions
    func fetchData(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        guard let station = self.station else {return}
        
        DispatchQueue.global(qos: .background).async {
            BackendAPI.shared.fetchStationFor(code: station.stationCode, success: { (response) in
                let xml = SWXMLHash.parse(response as? String ?? "")
                self.stationsDetailItems.removeAll()
                
                for xmlElement in xml["ArrayOfObjStationData"]["objStationData"].all {
                    let stationData = StationDetail(stationFullName: xmlElement["Stationfullname"].element?.text,
                                                    trainCode: xmlElement["Traincode"].element?.text,
                                                    queryTime: xmlElement["Querytime"].element?.text,
                                                    origin: xmlElement["Origin"].element?.text,
                                                    destination: xmlElement["Destination"].element?.text,
                                                    status: xmlElement["Status"].element?.text,
                                                    scheduledDepartTime: xmlElement["Schdepart"].element?.text,
                                                    scheduledArrivalTime: xmlElement["Scharrival"].element?.text,
                                                    direction: xmlElement["Direction"].element?.text,
                                                    trainType: xmlElement["Traintype"].element?.text,
                                                    expectedDepartureTime: xmlElement["Expdepart"].element?.text)
                    self.stationsDetailItems.append(stationData)
                }
                
                success(self.stationsDetailItems as AnyObject)
            }, failure: { (error) in
                if let error = error {
                    failure(error)
                }
            })
        }
    }
}
