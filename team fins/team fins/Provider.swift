//
//  Provider.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import UIKit
import Alamofire

struct Provider {
    let uid: Int
    let phoneNumber: String
    let locationName: String
    let generalDescription: String
    let totalBeds: Int
    let occupiedBeds: Int
    let intakeStart: Int
    let intakeEnd: Int
    
    init(fromJSON: JSON) {
        uid = fromJSON["uid"].int ?? 0
        phoneNumber = fromJSON["phone"].string ?? ""
        locationName = fromJSON["location"].string ?? ""
        generalDescription = fromJSON["description"].string ?? ""
        totalBeds = fromJSON["totalBeds"].int ?? 0
        occupiedBeds = fromJSON["occupiedBeds"].int ?? 0
        intakeStart = fromJSON["intakeStart"].int ?? 0
        intakeEnd = fromJSON["intakeEnd"].int ?? 0
    }
}

struct AcceptedClients {
    let men: Bool
    let women: Bool
    let children: Bool
    let veterans: Bool
    let disabled: Bool
}

struct Address {
    let line1: String
    let line2: String?
    let city: String
    let state: String
    let zip: Int
}

struct GpsLocation {
    let lat: Float
    let long: Float
}
