//
//  EditProviderDetailsViewController.swift
//  team fins
//
//  Created by Trey Baugher on 10/22/16.
//  Copyright © 2016 Team Fins. All rights reserved.
//

import UIKit

class EditProviderDetailsViewController: UIViewController {
    
    var localProvider: Provider?
    
    class func newController(provider: Provider) -> EditProviderDetailsViewController {
        let providerController = EditProviderDetailsViewController(nibName: "EditProviderDetailsViewController", bundle: nil)
        providerController.localProvider = provider
        return providerController
    }
}
