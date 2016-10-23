//
//  EditProviderDetailsViewController.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import UIKit

class EditProviderDetailsViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel?
    @IBOutlet weak var newProviderButtons: UIView?
    @IBOutlet weak var existingProviderButtons: UIView?
    
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var bedCountField: UITextField?
    @IBOutlet weak var phoneField: UITextField?
    @IBOutlet weak var descriptionField: UITextView?
    @IBOutlet weak var phStartTimeLabel: UILabel?
    @IBOutlet weak var startTimeLabel: UILabel?
    @IBOutlet weak var phEndTimeLabel: UILabel?
    @IBOutlet weak var endTimeLabel: UILabel?

    
    @IBOutlet weak var menClientView: ClientTypeView? {
        didSet {
            menClientView?.representType(name: "men")
        }
    }
    @IBOutlet weak var womenClientView: ClientTypeView? {
        didSet {
            womenClientView?.representType(name: "women")
        }
    }
    @IBOutlet weak var childrenClientView: ClientTypeView? {
        didSet {
            childrenClientView?.representType(name: "family")
        }
    }
    @IBOutlet weak var veteranClientView: ClientTypeView? {
        didSet {
            veteranClientView?.representType(name: "veteran")
        }
    }
    @IBOutlet weak var disabledClientView: ClientTypeView? {
        didSet {
            disabledClientView?.representType(name: "disabled")
        }
    }
    
    var provider: Provider?
    weak var updateReceiver: ReceivesProviderUpdates?
    
    class func newController(forProvider provider: Provider, updateReceiver: ReceivesProviderUpdates?) -> EditProviderDetailsViewController {
        let vc = EditProviderDetailsViewController.init(nibName: "EditProviderDetailsViewController", bundle: nil)
        vc.provider = provider
        vc.updateReceiver = updateReceiver
        vc.updateFields()
        return vc
    }
    
    @IBAction func cancelEdits() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveEdits() {
        
    }
    
    @IBAction func pickStartTime() {
        
    }
    
    @IBAction func pickEndTime() {
        
    }
    
    func updateFields() {
        guard let provider = provider else { return }
        let isExistingProvider = provider.locationName.characters.count > 0
        newProviderButtons?.isHidden = isExistingProvider
        existingProviderButtons?.isHidden = !isExistingProvider
        
        //TODO: update fields for passed in object
    }
}
