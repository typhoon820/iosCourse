//
//  SettingsController.swift
//  NewsApps
//
//  Created by Andrey Zonov on 11/12/2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    
    @IBOutlet weak var wylsaSwitch: UISwitch!
    @IBOutlet weak var lentaSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender === wylsaSwitch {
            
        } else if sender === lentaSwitch {
            
        } else {
            assertionFailure("Unhandeled \(sender)")
        }
    }
}
