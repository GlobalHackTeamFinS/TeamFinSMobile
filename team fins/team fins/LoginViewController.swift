//
//  ViewController.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    
    @IBAction func attemptLogin() {
        guard let username = usernameField?.text else { return }
        guard let password = passwordField?.text else { return }
        
        
    }
}

