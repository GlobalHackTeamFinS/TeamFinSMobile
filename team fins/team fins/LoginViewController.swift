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
        let validUser = ValidationHelper.validEmail(email: username)
        let validPassword = ValidationHelper.validPassword(pass: password)
        if (!validPassword.success) {
            if let error = validPassword.error {
                self.failedLabel(withTitle: error)
            }
        } else if (!validUser) {
            self.failedLabel(withTitle: "Please enter a valid email address.")
        } else {
            RemoteServiceManager.authenticateUser(username: username, password: password) { responseProvider in
                guard responseProvider != nil else {
                    self.failedAlert(withTitle: "Error", andMessage: "We were unable to validate your username and password, please try again.")
                    return
                }
                
            }
        }
        
    }
    
    @IBAction func createAccount() {
        errorLabel?.isHidden = true
        let accountController = CreateAccountViewController.newInstance()
        self.navigationController?.pushViewController(accountController, animated: true)
    }
    
    func failedLabel(withTitle: String) {
        errorLabel?.text = withTitle
        errorLabel?.isHidden = false
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

