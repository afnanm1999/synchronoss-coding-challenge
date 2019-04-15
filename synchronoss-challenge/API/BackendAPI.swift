//
//  BackendAPI.swift
//  synchronoss-challenge
//
//  Created by Afnan Mirza on 4/14/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

typealias SuccessHandler = (AnyObject?) -> Void
typealias FailureHandler = (Error?) -> Void

/// This class is used to handle API related stuff.
class BackendAPI {
    
    /// The Base URL for the API.
    let baseUrl = "http://api.irishrail.ie/realtime/realtime.asmx"
    
    // Create only one instance of the class
    static let shared = BackendAPI()
    private init() {}
    
    /// This function is used to fetch all stations from the `http://api.irishrail.ie` API.
    ///
    /// - Parameter success: The Success handler will be called if the request completed successfully. This handler will also return `AnyObject` value which can be used to parse XML.
    /// - Parameter failure: The Failure handler will be called if the request has failed. This handler will also return `Error` which can be used to see the reason for failure.
    ///
    func fetchAllStations(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.createAPICall(with: URL(string: "\(baseUrl)/getAllStationsXML")!, success: success, failure: failure)
    }
    
    /// This function is used to fetch Station data using the provided station code.
    ///
    /// - Parameter code: The code for the station you want to get information on.
    /// - Parameter success: The Success handler will be called if the request completed successfully. This handler will also return `AnyObject` value which can be used to parse XML.
    /// - Parameter failure: The Failure handler will be called if the request has failed. This handler will also return `Error` which can be used to see the reason for failure.
    ///
    func fetchStationFor(code: String, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.createAPICall(with: URL(string: "\(baseUrl)/getStationDataByCodeXML?StationCode=\(code)")!, success: success, failure: failure)
    }
    
    /// Creates a Network call with the specified `url`, and `httpMethod`.
    ///
    /// - Parameter url: The URL for the request.
    /// - Parameter httpMethod: The httpMethod for the request. Default is "GET".
    /// - Parameter success: The Success handler will be called if the request completed successfully. This handler will also return `AnyObject` value which can be used to parse XML.
    /// - Parameter failure: The Failure handler will be called if the request has failed. This handler will also return `Error` which can be used to see the reason for failure.
    ///
    func createAPICall(with url: URL, httpMethod: String = "GET", success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 120)
        urlRequest.httpMethod = httpMethod
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                failure(error)
            } else {
                if let data = data {
                    DispatchQueue.main.async {
                        let string = String(data: data, encoding: .utf8)
                        success(string as AnyObject)
                    }
                }
            }
        }
        task.resume()
    }
}
