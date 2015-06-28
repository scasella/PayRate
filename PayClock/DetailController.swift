//
//  DetailController.swift
//  PayRate
//
//  Created by Stephen Casella on 6/21/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

var settingsDict: [String: Double] = ["PayRate": 0.0, "TaxRate": 0.0, "InnerCircle": 0.0, "OuterCircle": 0.0, "AdjustTime": 0.0, "AdjustPay": 0.0]

class DetailController: UIViewController {
    
    @IBOutlet var payField: MadokaTextField!
    @IBOutlet var taxField: MadokaTextField!
    @IBOutlet var innerField: MadokaTextField!
    @IBOutlet var outerField: MadokaTextField!
    @IBOutlet var adjustTimeField: MadokaTextField!
    @IBOutlet var adjustPayField: MadokaTextField!
    
    
    
    @IBAction func saveClicked(sender: AnyObject) {
        if payField.text == "" {
            settingsDict.updateValue(0.0, forKey: "PayRate")
        } else {
            settingsDict.updateValue((payField.text as NSString).doubleValue, forKey: "PayRate") }
        
        if taxField.text == "" {
            settingsDict.updateValue(0.0, forKey: "TaxRate")
        } else {
            settingsDict.updateValue((taxField.text as NSString).doubleValue, forKey: "TaxRate") }
            
        if innerField.text == "" {
        settingsDict.updateValue(0.0, forKey: "InnerCircle")
        } else {
            settingsDict.updateValue((innerField.text as NSString).doubleValue, forKey: "InnerCircle") }
            
        if outerField.text == "" {
        settingsDict.updateValue(0.0, forKey: "OuterCircle")
        } else {
            settingsDict.updateValue((outerField.text as NSString).doubleValue, forKey: "OuterCircle") }
        
        if adjustTimeField.text == "" {
        settingsDict.updateValue(0.0, forKey: "AdjustTime")
        } else {
            settingsDict.updateValue((adjustTimeField.text as NSString).doubleValue, forKey: "AdjustTime") }
            
        if adjustPayField.text == "" {
        settingsDict.updateValue(0.0, forKey: "AdjustPay")
        } else {
        settingsDict.updateValue((adjustPayField.text as NSString).doubleValue, forKey: "AdjustPay") }
        
        if settingsDict["TaxRate"] == nil {
        secondRate = settingsDict["PayRate"]! / 60 / 60 }
        else {
            var effectiveRate = 1.0 - settingsDict["TaxRate"]!
            secondRate = settingsDict["PayRate"]! * effectiveRate / 60 / 60
        
            }
        
        performSegueWithIdentifier("backToMain", sender: self)
        
    }
    

  
    override func viewDidLoad() {

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func payEdit(sender: MadokaTextField) {
        var dict = settingsDict["PayRate"]!
        if dict == 0.0 {
            payField.text = nil
        } else {
            payField.text = "\(dict)" }
    }
    
    

    @IBAction func taxEdit(sender: MadokaTextField) {
        var dict1 = settingsDict["TaxRate"]!
        if dict1 == 0.0 {
        taxField.text = nil } else {
        taxField.text = "\(dict1)" }
    }
    
    
    
    @IBAction func innerEdit(sender: MadokaTextField) {
        var dict2 = settingsDict["InnerCircle"]!
        if dict2 == 0.0 {
        innerField.text = nil } else {
        innerField.text = "\(dict2)" }
    }
    
    
    
    @IBAction func outerEdit(sender: MadokaTextField) {
        var dict3 = settingsDict["OuterCircle"]!
        if dict3 == 0.0 {
        outerField.text = nil } else {
        outerField.text = "\(dict3)"}
    }
    
    
    
    @IBAction func timeEdit(sender: MadokaTextField) {
        var dict4 = settingsDict["AdjustTime"]!
        if dict4 == 0.0 {
            adjustTimeField.text = nil } else {
        adjustTimeField.text = "\(dict4)"}
    }
    
    
    
    @IBAction func payTouch(sender: MadokaTextField) {
        var dict5 = settingsDict["AdjustPay"]!
        if dict5 == 0.0 {
        adjustPayField.text = nil } else {
        adjustPayField.text = "\(dict5)" }
    }
    

    
    
    
}
