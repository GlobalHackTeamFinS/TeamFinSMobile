//
//  CreateAccountViewController.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    @IBOutlet weak var confirmPasswordField: UITextField?
    @IBOutlet weak var errorLabel: UILabel?
    
    class func newController() -> CreateAccountViewController {
        let accountController = CreateAccountViewController(nibName: "CreateAccountViewController", bundle: nil)
        return accountController
    }
    
    @IBAction func cancelSignup() {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func attemptSignup() {
        errorLabel?.isHidden = true
        guard let username = usernameField?.text else { return }
        guard let pass = passwordField?.text else { return }
        guard let pass2 = confirmPasswordField?.text else { return }
        
        guard ValidationHelper.validEmail(email: username) else {
            displayError(text:"Please provide a valid email")
            return
        }
        
        let result = ValidationHelper.validPassword(pass: pass, confirmPass:pass2)
        guard result.success else {
            displayError(text:result.error ?? "Please try again")
            return
        }
        
        RemoteServiceManager.createUser(username: username, password: pass) {
            [weak self] responseProvider in
            guard responseProvider != nil else {
                self?.displayError(text: "Failed to login. Please try again.")
                return
            }
            if let provider = responseProvider {
                self?.pushToDetailsController(provider: provider)
            }
        }
    }
    
    func pushToDetailsController(provider: Provider) {
        let detailsController = EditProviderDetailsViewController.newController(provider: provider)
        self.navigationController?.pushViewController(detailsController, animated: true)
    }
        
    func displayError(text: String) {
        errorLabel?.text = text
        errorLabel?.isHidden = false
    }
}
