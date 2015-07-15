//
//  DetailController.swift
//  PayRate
//
//  Created by Stephen Casella on 6/21/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

var settingsDict: [String: Double] = ["PayRate":0.0, "LittleCircle":1.0, "BigCircle":5.0]

class DetailController: UIViewController {
    
    enum settingsChoice {case None,Pay,Little,BigCircle,Adjust}
    
    var settingsSet = settingsChoice.None
    
    var payUnsaved = false
    var taxUnsaved = false
    var LittleUnsaved = false
    var outerUnsaved = false
    var adjustingTime = false
    var adjustingPay = false
    
    @IBOutlet var settingsField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var settingsLabel: UILabel!
    
    @IBOutlet var payHighlight: UIImageView!
    @IBOutlet var littleHighlight: UIImageView!
    @IBOutlet var bigHighlight: UIImageView!
    @IBOutlet var adjustHighlight: UIImageView!
    
    
    
    @IBAction func backPressed(sender: AnyObject) {
        if settingsSet == .None {
            performSegueWithIdentifier("backToMain", sender: self)
        } else { resetAllObjects()
        
        }}
    
    
    
    @IBAction func setToPay(sender: AnyObject) {
        settingsSet = .Pay
        objectSetup("PayRate", enumValue: settingsSet)
    }
    
    
    
    @IBAction func setToLittle(sender: AnyObject) {
        settingsSet = .Little
        objectSetup("LittleCircle", enumValue: settingsSet)

    }
    
    
    
    @IBAction func setToBig(sender: AnyObject) {
        settingsSet = .BigCircle
        objectSetup("BigCircle", enumValue: settingsSet)
    
    }
    
    
/*
    @IBAction func setToAdjust(sender: AnyObject) {
        settingsSet = .Adjust
        objectSetup("LittleCircle", enumValue: settingsSet)
    }
  */  
   
    
    @IBAction func saveClicked(sender: AnyObject) {
        switch settingsSet {
        case .Pay: saveObject("PayRate")

        case .Little: saveObject("LittleCircle")

        case .BigCircle: saveObject("BigCircle")

       /* case .Adjust: settingsDict.updateValue((settingsField.text as NSString).doubleValue, forKey: "PayRate")
        NSUserDefaults.standardUserDefaults().setObject(settingsDict["PayRate"], forKey: "payRate")*/

        default:
            println("Not a safe place for humans")
        }
        
        //performSegueWithIdentifier("backToMain", sender: self)
        
    }
    

  
    override func viewDidLoad() {
        if NSUserDefaults.standardUserDefaults().objectForKey("PayRate") != nil {
            settingsDict["PayRate"] = (NSUserDefaults.standardUserDefaults().objectForKey("PayRate") as! Double) }
       
        if NSUserDefaults.standardUserDefaults().objectForKey("LittleCircle") != nil {
            settingsDict["LittleCircle"] = (NSUserDefaults.standardUserDefaults().objectForKey("LittleCircle") as! Double) }
       
        if NSUserDefaults.standardUserDefaults().objectForKey("BigCircle") != nil {
            settingsDict["BigCircle"] = (NSUserDefaults.standardUserDefaults().objectForKey("BigCircle") as! Double) }
     }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func resetAllObjects() {
        settingsLabel.text = "Settings"
        settingsField.text = ""
        settingsField.placeholder = "tap below"
        settingsField.enabled = false
        saveButton.enabled = false
        payHighlight.hidden = true
        littleHighlight.hidden = true
        bigHighlight.hidden = true
        adjustHighlight.hidden = true
        settingsSet = .None
    }
    
    
    
    func saveObject(object: String) {
        settingsDict.updateValue((settingsField.text as NSString).doubleValue, forKey: object)
        NSUserDefaults.standardUserDefaults().setObject(settingsDict[object], forKey: object)
        resetAllObjects()
    }
    
    
    
    func objectSetup(object: String, enumValue: settingsChoice) {
        let dictLookup = settingsDict[object]!
        settingsField.text = "\(dictLookup)"
        settingsField.enabled = true
        saveButton.enabled = true
        
        switch enumValue {
        case .Pay:
            settingsLabel.text = "Pay Rate"
            payHighlight.hidden = false
            littleHighlight.hidden = true
            bigHighlight.hidden = true
            adjustHighlight.hidden = true
        case .Little:
            settingsLabel.text = "Inner Circle Finishes Every"
            payHighlight.hidden = true
            littleHighlight.hidden = false
            bigHighlight.hidden = true
            adjustHighlight.hidden = true
        case .BigCircle:
            settingsLabel.text = "Outer Circle Finishes Every"
            payHighlight.hidden = true
            littleHighlight.hidden = true
            bigHighlight.hidden = false
            adjustHighlight.hidden = true
        case .Adjust:
            settingsLabel.text = "Adjust Time/Pay"
            payHighlight.hidden = true
            littleHighlight.hidden = true
            bigHighlight.hidden = true
            adjustHighlight.hidden = false
            /*//pull in totalPay and totalHours
            settingsField.text = "\(dictLookup)"
            settingsField.enabled = true*/
        default: println("nil")

        }
    }
    
    
   /* function for adjust time/pay
    @IBAction func timeChanged(sender: MadokaTextField) {
        var calculateNewHours = (adjustTimeField.text as NSString).doubleValue - totalHours
        
        adjustsettingsField.text = "\(calculateNewHours * secondRate * 60 * 60 + totalPay)"
        
    }
    */
    

}
