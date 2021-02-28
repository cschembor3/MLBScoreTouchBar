//
//  NHLScoreService.swift
//  NHLScoreBar
//
//  Created by Connor Schembor on 10/6/20.
//  Copyright © 2020 Connor Schembor. All rights reserved.
//

import Foundation
import Alamofire

protocol NHLService {
    func makeRequest()
}

class NHLScoreService: NHLService {
    static let nhlApiBaseUrl = "https://statsapi.web.nhl.com/api/v1/schedule"
    
    func makeRequest() {
        AF.request(NHLScoreService.nhlApiBaseUrl + "?teamId=1").response { response in
            debugPrint(response)
        }
    }
}
