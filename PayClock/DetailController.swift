//
//  DetailController.swift
//  PayRate
//
//  Created by Stephen Casella on 6/21/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    
    @IBOutlet var payRate: YokoTextField!
    
    @IBAction func saveClicked(sender: AnyObject) {
        
        hourlyRate = (payRate.text as NSString).doubleValue
        secondRate = hourlyRate / 60 / 60
        performSegueWithIdentifier("backToMain", sender: self)
        
    }
    
    
    
    override func viewDidLoad() {
        
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
