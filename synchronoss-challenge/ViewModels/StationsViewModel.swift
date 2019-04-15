//
//  StationsViewModel.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

class StationsViewModel {
    
    // MARK: - Properties
    var stationsItems: [Station]
    
    // MARK: - Initializer
    init() {
        stationsItems = [Station]()
    }
    
    // MARK: - Public Functions
    
    /// This function will fetch the XML from the API and then append to `stationsItems` Station Model array.
    ///
    /// - Parameter success: The Success handler will be called if the request completed successfully. This handler will also return `AnyObject` value which can be used to parse XML.
    /// - Parameter failure: The Failure handler will be called if the request has failed. This handler will also return `Error` which can be used to see the reason for failure.
    ///
    func fetchData(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        DispatchQueue.global(qos: .background).async {
            BackendAPI.shared.fetchAllStations(success: { (response) in
                let xml = SWXMLHash.parse(response as? String ?? "")
                self.stationsItems.removeAll()
                
                do {
                    let stationsItemsArr: [Station] = try xml["ArrayOfObjStation"]["objStation"].value()
                    
                    // Only get Dalkey & Rathdrum
                    stationsItemsArr.forEach({ (station) in
                        if station.stationDesc == "Dalkey" || station.stationDesc == "Rathdrum" {
                            self.stationsItems.append(station)
                        }
                    })
                    
                    success(self.stationsItems as AnyObject)
                } catch let error {
                    failure(error)
                }
            }) { (error) in
                if let error = error {
                    failure(error)
                }
            }
        }
    }
}
