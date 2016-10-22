//
//  Provider.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import UIKit

struct Provider {
    let uid: Int
    let phoneNumber: String
    let locationName: String
    let generalDescription: String
    let totalBeds: Int
    let occupiedBeds: Int
    let intakeStart: Int
    let intakeEnd: Int
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
