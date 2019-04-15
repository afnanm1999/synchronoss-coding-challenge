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
    var stationsItems: [Station]
    
    // MARK: - Initializer
    init() {
        stationsItems = [Station]()
    }
    
    // MARK: - Public Functions
    func fetchData(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        DispatchQueue.global(qos: .background).async {
//            BackendAPI.shared.fetchAllStations(success: { (response) in
//                let xml = SWXMLHash.parse(response as? String ?? "")
//                self.stationsItems.removeAll()
//
//                do {
//                    let stationsItemsArr: [Station] = try xml["ArrayOfObjStation"]["objStation"].value()
//
//                    // Only get Dalkey & Rathdrum
//                    stationsItemsArr.forEach({ (station) in
//                        if station.stationDesc == "Dalkey" || station.stationDesc == "Rathdrum" {
//                            self.stationsItems.append(station)
//                        }
//                    })
//                } catch let error {
//                    print("Error Occured while trying to parse XML: \(error.localizedDescription)")
//                }
//
//                success(self.stationsItems as AnyObject)
//            }) { (error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                    failure(error)
//                }
//            }
        }
    }
}
