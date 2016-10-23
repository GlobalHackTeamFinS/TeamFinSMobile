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
    
    static func authenticateUser(username: String, password: String, withProvider: @escaping (Provider?) -> Void) {
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
                withProvider(nil)
            }
        }
    }
    
    static func createUser(username: String, password: String, forProvider: @escaping (Provider?) -> Void) {
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
                forProvider(provider)
            case .failure(let error):
                print(error)
                forProvider(nil)
            }
        }
    }
    
    static func incrementOccupancyFor(providerId: String, completion: @escaping (Bool) -> Void) {
        let occupancyUrl = "";
        let parameters: Parameters = [
            "providerId" : providerId
        ]
        
        Alamofire.request(occupancyUrl, parameters: parameters).response { response in
            
            if ((response.error) != nil) {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    static func decrementOccupancyFor(providerId: String, completion: @escaping (Bool) -> Void) {
        let occupancyUrl = "";
        let parameters: Parameters = [
            "providerId" : providerId
        ]
        
        Alamofire.request(occupancyUrl, parameters: parameters).response { response in
            if (response.error != nil) {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    static func updateProviderFor(providerId:String, phoneNumber: String?, locationName: String?, description: String?, totalBeds: Int?, occupiedBeds: Int?, intakeStart: Int?, intakeEnd: Int?, completion: @escaping (Provider?) -> Void) {
        let updateUrl = "";
        var parameters: Parameters = [:]
        parameters["providerId"] = providerId
        if let phone = phoneNumber {
            parameters["phone"] = phone
        }
        if let location = locationName {
            parameters["locationName"] = location
        }
        if let descriptionString = description {
            parameters["description"] = descriptionString
        }
        if let tBedsInt = totalBeds {
            parameters["totalBeds"] = tBedsInt
        }
        if let oBedsInt = occupiedBeds {
            parameters["occupiedBeds"] = oBedsInt
        }
        if let iStart = intakeStart {
            parameters["intakeStart"] = iStart
        }
        if let iEnd = intakeEnd {
            parameters["intakeEnd"] = iEnd
        }
        Alamofire.request(updateUrl, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let provider = Provider(fromJSON: json)
                completion(provider)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
    static func sampleProviderIdentifier() -> String {
        return "56bafde0-d2bd-44b5-8f09-8a30d1647eaa"
    }
}
