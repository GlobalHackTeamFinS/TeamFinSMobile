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
    static func createAccount(username: String, password: String) -> Bool {
        // send username and password to server
        
        return false
    }
    
    static func authenticateUser(username: String, password: String, withProvider: @escaping (Provider) -> Void) {
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
                withProvider(provider)
            case .failure(let error):
                print(error)
            }
        }
    }
}
