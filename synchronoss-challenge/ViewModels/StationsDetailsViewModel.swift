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
    
    /// This function will fetch the XML from the API and then append to `stationsDetailItems` StationDetails Model array.
    ///
    /// - Parameter success: The Success handler will be called if the request completed successfully. This handler will also return `AnyObject` value which can be used to parse XML.
    /// - Parameter failure: The Failure handler will be called if the request has failed. This handler will also return `Error` which can be used to see the reason for failure.
    ///
    func fetchData(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        guard let station = self.station else {
            let error = NSError(domain: "stationVariableNotSet",
                                code: 1023,
                                userInfo: [NSLocalizedDescriptionKey: "The Station Value cannot be nil. Please check the code and try again."])
            failure(error)
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            BackendAPI.shared.fetchStationFor(code: station.stationCode, success: { (response) in
                let xml = SWXMLHash.parse(response as? String ?? "")
                self.stationsDetailItems.removeAll()
                
                do {
                    self.stationsDetailItems = try xml["ArrayOfObjStationData"]["objStationData"].value()
                    success(self.stationsDetailItems as AnyObject)
                } catch let error {
                    failure(error)
                }
            }, failure: { (error) in
                if let error = error {
                    failure(error)
                }
            })
        }
    }
}
