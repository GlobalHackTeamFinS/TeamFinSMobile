//
//  RemoteService.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import Foundation
import Alamofire

struct RemoteServiceManager {
    
    static func authenticateUser(username: String, password: String, withProvider: @escaping (Provider?, Bool) -> Void) {
        let authenticationUrl = "";
        let parameters: Parameters = [
            "user": username,
            "password": password
        ]
        
        Alamofire.request(authenticationUrl, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let provider = Provider(fromJSON: json)
                withProvider(provider, true)
            case .failure(let error):
                print(error)
                withProvider(nil, false)
            }
        }
    }
    
    static func createUser(username: String, password: String, forProvider: @escaping (Provider?, Bool) -> Void) {
        let createUrl = "";
        let parameters: Parameters = [
            "user": username,
            "password": password
        ]
        
        Alamofire.request(createUrl, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let provider = Provider(fromJSON: json)
                forProvider(provider, true)
            case .failure(let error):
                print(error)
                forProvider(nil, false)
            }
        }
    }
}
