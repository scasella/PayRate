//
//  DetailController.swift
//  PayRate
//
//  Created by Stephen Casella on 6/21/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

var settingsDict: [String: Double] = ["PayRate":0.0, "TaxRate":0.0, "InnerCircle":1.0, "OuterCircle":5.0, "AdjustTime":totalHours, "AdjustPay":totalPay]

class DetailController: UIViewController {
    
    var payUnsaved = false
    var taxUnsaved = false
    var innerUnsaved = false
    var outerUnsaved = false
    var adjustingTime = false
    var adjustingPay = false
    
    @IBOutlet var payField: MadokaTextField!
    @IBOutlet var taxField: MadokaTextField!
    @IBOutlet var innerField: MadokaTextField!
    @IBOutlet var outerField: MadokaTextField!
    @IBOutlet var adjustTimeField: MadokaTextField!
    @IBOutlet var adjustPayField: MadokaTextField!
    
    
    
    @IBAction func saveClicked(sender: AnyObject) {
        if payField.text == "" {
            } else {
            settingsDict.updateValue((payField.text as NSString).doubleValue, forKey: "PayRate") }
        
        if taxField.text == "" {
            } else {
            settingsDict.updateValue((taxField.text as NSString).doubleValue, forKey: "TaxRate") }
            
        if innerField.text == "" {
            } else {
            settingsDict.updateValue((innerField.text as NSString).doubleValue, forKey: "InnerCircle") }
        
        if outerField.text == "" {
            } else {
            settingsDict.updateValue((outerField.text as NSString).doubleValue, forKey: "OuterCircle") }
        
        if adjustTimeField.text == "" {
            } else {
            settingsDict.updateValue((adjustTimeField.text as NSString).doubleValue, forKey:"AdjustTime") }
            
        if adjustPayField.text == "" {
            } else {
            settingsDict.updateValue((adjustPayField.text as NSString).doubleValue, forKey: "AdjustPay") }
        
        if settingsDict["TaxRate"] == nil {
            secondRate = settingsDict["PayRate"]! / 60 / 60
            } else {
            var effectiveRate = 1.0 - settingsDict["TaxRate"]!
            secondRate = settingsDict["PayRate"]! * effectiveRate / 60 / 60
            }
        
        performSegueWithIdentifier("backToMain", sender: self)
        
    }
    

  
    override func viewDidLoad() {
         payUnsaved = false
         taxUnsaved = false
         innerUnsaved = false
         outerUnsaved = false
         adjustingTime = false
         adjustingPay = false

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func payEdit(sender: MadokaTextField) {
    var dict = settingsDict["PayRate"]!
    if payUnsaved == false {
        if dict == 0.0 {
            payField.text = nil
            payUnsaved = true
        } else {
            payField.text = "\(dict)"
            payUnsaved = true }
        } else if payField.text == "" && dict != 0.0{
            payField.text = "\(dict)"}
    }
    
    

    @IBAction func taxEdit(sender: MadokaTextField) {
    var dict1 = settingsDict["TaxRate"]!
    if taxUnsaved == false {
        if dict1 == 0.0 {
            taxField.text = nil
            taxUnsaved = true
        } else {
            taxField.text = "\(dict1)"
            taxUnsaved = true }
        } else if taxField.text == "" && dict1 != 0.0{
            taxField.text = "\(dict1)"}
    }
    
    
    
    @IBAction func innerEdit(sender: MadokaTextField) {
    var dict2 = settingsDict["InnerCircle"]!
    if innerUnsaved == false {
        if dict2 == 0.0 {
            innerField.text = nil
            innerUnsaved = true
        } else {
            innerField.text = "\(dict2)"
            innerUnsaved = true }
        } else if innerField.text == "" && dict2 != 0.0{
            innerField.text = "\(dict2)"}

    }
    
    
    
    @IBAction func outerEdit(sender: MadokaTextField) {
    var dict3 = settingsDict["OuterCircle"]!
    if outerUnsaved == false {
        if dict3 == 0.0 {
            outerField.text = nil
            outerUnsaved = true
        } else {
            outerField.text = "\(dict3)"
            outerUnsaved = true }
        } else if outerField.text == "" && dict3 != 0.0 {
            outerField.text = "\(dict3)"}
    }
    
    
    
    @IBAction func timeEdit(sender: MadokaTextField) {
     var dict4 = settingsDict["AdjustTime"]!
     if adjustingTime == false {
        if dict4 == 0.0 {
            adjustTimeField.text = nil
            adjustingTime = true
        } else {
            adjustTimeField.text = "\(dict4)"
            adjustingTime = true }
        } else if adjustTimeField.text == "" && dict4 != 0.0 {
            adjustTimeField.text = "\(dict4)"}
    }
    
    
    
    @IBAction func payTouch(sender: MadokaTextField) {
    var dict5 = settingsDict["AdjustPay"]!
    if adjustingPay == false {
        if dict5 == 0.0 {
            adjustPayField.text = nil
        } else {
            adjustPayField.text = "\(dict5)"
            adjustingPay = true }
        } else if adjustPayField.text == "" && dict5 != 0.0 {
            adjustPayField.text = "\(dict5)"}
    }
    

    
}
