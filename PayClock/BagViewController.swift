//
//  File.swift
//  PayRate
//
//  Created by Stephen Casella on 6/30/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

class BagViewController: UIViewController {
    
    var labelToggle = true
    
    @IBOutlet var label: UILabel!
    
    @IBAction func changeLabel(sender: AnyObject) {
        if labelToggle == true {
            label.text = "$\(round(totalPay * 100) / 100)"
            labelToggle = false
        } else {
            label.text = "\(totalHours)"
            labelToggle = true
        }
        }
    


    override func viewDidLoad() {
        label.text = "$\(round(totalPay * 100) / 100)"
        
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
