//
//  EditProviderAddressViewController.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import UIKit

class EditProviderAddressViewController: UIViewController {
    
    @IBOutlet weak var addressField1: UITextField?
    @IBOutlet weak var addressField2: UITextField?
    @IBOutlet weak var cityField: UITextField?
    @IBOutlet weak var zipcodeField: UITextField?
    @IBOutlet weak var placeholderStateLabel: UILabel?
    @IBOutlet weak var stateLabel: UILabel?
    @IBOutlet weak var errorLabel: UILabel?
    @IBOutlet weak var newProviderButtons: UIView?
    @IBOutlet weak var existingProviderButtons: UIView?
    
    var provider: Provider?
    weak var updateReceiver: ReceivesProviderUpdates?

    class func newController(forProvider provider: Provider, updateReceiver: ReceivesProviderUpdates?) -> EditProviderAddressViewController {
        let vc = EditProviderAddressViewController.init(nibName: "EditProviderAddressViewController", bundle: nil)
        vc.provider = provider
        vc.updateReceiver = updateReceiver
        vc.updateFields()
        return vc
    }
    
    func updateFields() {
        guard let provider = provider else { return }
        let isExistingProvider = provider.locationName.characters.count > 0
        newProviderButtons?.isHidden = isExistingProvider
        existingProviderButtons?.isHidden = !isExistingProvider
        
        addressField1?.text = provider.address.line1
        addressField2?.text = provider.address.line2
        cityField?.text = provider.address.city
        zipcodeField?.text = (provider.address.zip == 0 ? "" : "\(provider.address.zip)" )
        if provider.address.state.characters.count == 2 {
            stateLabel?.text = provider.address.state
            stateLabel?.isHidden = false
        } else {
            stateLabel?.isHidden = true
        }
    }
    
    func validateFields() -> (Bool, String?) {
        guard let address1 = addressField1?.text else { return (false, "Please provide a valid address") }
        guard let city = cityField?.text else { return (false, "Please provide a valid address") }
        guard let zipcode = zipcodeField?.text else { return (false, "Please provide a valid address") }

        guard let stateLabel = stateLabel else { return (false, "Please provide a valid address") }
        guard !stateLabel.isHidden else { return (false, "Please provide a valid address") }
        guard let state = stateLabel.text else { return (false, "Please provide a valid address") }

        let address2 = addressField2?.text
        
        return (true, nil)
    }
    
    
    @IBAction func pickState() {
        //TODO: Deal with component and update label
    }
    
    @IBAction func saveChanges() {
        let result = validateFields()
        guard result.0 else {
            errorLabel?.text = result.1
            return
        }
        
        //todo: inform provider of update
    }
    
    @IBAction func cancelEdit() {
         navigationController?.popViewController(animated: true)
    }
    
}
