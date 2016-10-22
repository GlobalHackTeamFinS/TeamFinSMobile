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
    @IBOutlet weak var errorLabel: UILabel?
    
    @IBAction func attemptLogin() {
        errorLabel?.isHidden = true
        guard let username = usernameField?.text else { return }
        guard let password = passwordField?.text else { return }

        RemoteServiceManager.authenticateUser(username: username, password: password) {
            [weak self] responseProvider in
            guard responseProvider != nil else {
                self?.failedLabel(withTitle: "Login Failed")
                return
            }
            
            //TODO: navigate to client intake controller
        }
        
    }
    
    @IBAction func createAccount() {
        errorLabel?.isHidden = true
        let accountController = CreateAccountViewController.newController()
        navigationController?.pushViewController(accountController, animated: true)
    }
    
    func failedLabel(withTitle: String) {
        errorLabel?.text = withTitle
        errorLabel?.isHidden = false
    }
    
    func clearFields() {
        usernameField?.text = ""
        passwordField?.text = ""
    }
}

