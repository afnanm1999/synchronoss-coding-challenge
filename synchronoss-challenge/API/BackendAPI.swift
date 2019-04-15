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

class BackendAPI {
    
    let baseUrl = "http://api.irishrail.ie/realtime/realtime.asmx"
    
    static let shared = BackendAPI()
    
    private init() {}
    
    func fetchAllStations(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        var urlRequest = URLRequest(url: URL(string: "\(baseUrl)/getAllStationsXML")!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 120)
        urlRequest.httpMethod = "GET"
        
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
    
    
    func fetchStationFor(code: String, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
    }
}
