//
//  File.swift
//  PayRate
//
//  Created by Stephen Casella on 6/30/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

class BagViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        
        label.text = "$\(round(totalPay * 100) / 100)"
        
    }
    
    
}
