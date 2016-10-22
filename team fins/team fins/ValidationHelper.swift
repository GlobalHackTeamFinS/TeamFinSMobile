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
    
    static func validPassword(pass: String) -> (success: Bool, error: String?) {
        if pass.characters.count < 8 {
            return (false, "Your password must be at least 8 characters long")
        }
        
        guard ValidationHelper.containsLetter(text: pass) else {
            return (false, "Your password must contain a letter")
        }
        
        guard ValidationHelper.containsNumber(text: pass) else {
            return (false, "Your password must contain a number")
        }
        
        return (true, nil)
    }

    static func containsLetter(text:String) -> Bool {
        let letterRegEx  = ".*[a-zA-Z]+.*"
        let letterVerification = NSPredicate(format:"SELF MATCHES %@", letterRegEx)
        return letterVerification.evaluate(with: text)
    }

    static func containsNumber(text:String) -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let numberVerification = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberVerification.evaluate(with: text)
    }
}
