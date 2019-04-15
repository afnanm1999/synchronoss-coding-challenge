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
