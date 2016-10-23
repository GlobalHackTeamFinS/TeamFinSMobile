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
    let acceptedClients: AcceptedClients
    let address: Address
    let gpsLocation: GpsLocation
    
    init(fromJSON: JSON) {
        uid = fromJSON["uid"].int ?? 0
        phoneNumber = fromJSON["phone"].string ?? ""
        locationName = fromJSON["location"].string ?? ""
        generalDescription = fromJSON["description"].string ?? ""
        totalBeds = fromJSON["totalBeds"].int ?? 0
        occupiedBeds = fromJSON["occupiedBeds"].int ?? 0
        intakeStart = fromJSON["intakeStart"].int ?? 0
        intakeEnd = fromJSON["intakeEnd"].int ?? 0
        acceptedClients = AcceptedClients.init(fromJSON: fromJSON["acceptedClients"])
        address = Address.init(fromJSON: fromJSON["address"])
        gpsLocation = GpsLocation.init(fromJSON: fromJSON["gpsLocation"])
    }
}

struct AcceptedClients {
    let men: Bool
    let women: Bool
    let children: Bool
    let veterans: Bool
    let disabled: Bool
    
    init(fromJSON: JSON) {
        men = fromJSON["men"].bool ?? false
        women = fromJSON["women"].bool ?? false
        children = fromJSON["children"].bool ?? false
        veterans = fromJSON["veterans"].bool ?? false
        disabled = fromJSON["disabled"].bool ?? false
    }
}

struct Address {
    let line1: String
    let line2: String?
    let city: String
    let state: String
    let zip: Int
    
    init(fromJSON: JSON) {
        line1 = fromJSON["line1"].string ?? ""
        line2 = fromJSON["line2"].string ?? ""
        city = fromJSON["city"].string ?? ""
        state = fromJSON["state"].string ?? ""
        zip = fromJSON["zip"].int ?? 0
    }
}

struct GpsLocation {
    let lat: Float
    let long: Float
    
    init(fromJSON: JSON) {
        lat = fromJSON["lat"].float ?? 0.0
        long = fromJSON["long"].float ?? 0.0
    }
}
