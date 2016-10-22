//
//  ValidationHelper.swift
//  team fins
//
//  Created by Sonny Rodriguez on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import Foundation

struct ValidationHelper {
    static func validEmail(email: String) -> Bool {
        let text = email.trimmingCharacters(in: NSCharacterSet.whitespaces)
        let regexString = ".+@.+\\..+"
        let predicate = NSPredicate.init(format: "SELF MATCHES \(regexString)")
        return predicate.evaluate(with: text)
    }
    
    static func validPassword(pass: String) -> Bool {
//        let regexString = "((?=.*[0-9])(?=.*[a-zA-Z]).{8,})"
//        try {
//            let regex = NSRegularExpression.init(pattern: regexString, options: .caseInsensitive)
//            let validPassword = regex.firstMatch(in: pass, options: NSRegularExpression.MatchingOptions(rawValue: UInt(0)), range: NSMakeRange(0, pass.characters.count))
//            return validPassword(pass: pass) && pass.characters.count > 7
//        }
        
    }
}
