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
        RemoteServiceManager.authenticateUser(username: username, password: password) { (provider, success) in
            
        }
    }
    
    func failedAlert(withTitle: String?, andMessage: String?) {
        let alert = UIAlertController(title: withTitle, message: andMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
            self.clearFields()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func clearFields() {
        usernameField?.text = ""
        passwordField?.text = ""
    }
}

