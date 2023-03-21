//
//  CenterAPI.swift
//  FindCoronaCenter
//
//  Created by thoonk on 2023/03/21.
//

import Foundation
import Combine

struct CenterAPI {
    static let scheme = "https"
    static let host = "api.odcloud.kr"
    static let path = "/15077586/v1/centers"
    
    func getCenterListComponents() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = CenterAPI.scheme
        components.host = CenterAPI.host
        components.path = CenterAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "perPage", value: "300")
        ]
        
        return components
    }
}
