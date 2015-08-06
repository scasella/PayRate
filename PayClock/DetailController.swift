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
  
    var adjustPay = true
    
    @IBOutlet var settingsField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var springView: SpringView!
    
    @IBOutlet var adjustLabel: UILabel!
    @IBOutlet var dollarLabel: UILabel!
    
    
    @IBAction func backPressed(sender: AnyObject) {
        if settingsSet == .None {
            performSegueWithIdentifier("backToMain", sender: self)
        } else { resetAllObjects()
        
        }}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "backToMain" {
        springView.animation = "fall"
        springView.x = -200
        springView.animate()
    
    }
    }
    
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
    
    

    @IBAction func setToAdjust(sender: AnyObject) {
        settingsSet = .Adjust
        if adjustPay == true {
            settingsLabel.text = "Adjust Pay"
            adjustLabel.text = "tap again to adjust time"
            adjustLabel.hidden = false
            dollarLabel.hidden = false
            settingsField.text = "\(round(totalPay * 100)/100)"
            settingsField.enabled = true
            settingsField.enabled = true
            saveButton.enabled = true
            adjustPay = false
        } else {
            settingsLabel.text = "Adjust Hours"
            adjustLabel.text = "tap again to adjust pay"
            adjustLabel.hidden = false
            dollarLabel.hidden = true
            settingsField.text = "\(round(totalHours * 100)/100)"
            settingsField.enabled = true
            settingsField.enabled = true
            saveButton.enabled = true
            adjustPay = true

        }
    }
  
   
    
    @IBAction func saveClicked(sender: AnyObject) {
        switch settingsSet {
        case .Pay: saveObject("PayRate")

        case .Little: saveObject("LittleCircle")

        case .BigCircle: saveObject("BigCircle")

        case .Adjust:
            
            if adjustPay == false {
                
            totalPay = (settingsField.text as NSString).doubleValue
            NSUserDefaults.standardUserDefaults().setObject(totalPay, forKey: "totalPay")
            
            } else {
            
            var adjustAmt = ((settingsField.text as NSString).doubleValue - totalHours) * settingsDict["PayRate"]!
            totalHours = (settingsField.text as NSString).doubleValue
            totalPay = totalPay + adjustAmt
            NSUserDefaults.standardUserDefaults().setObject(totalPay, forKey: "totalPay")
            NSUserDefaults.standardUserDefaults().setObject(totalHours, forKey: "totalHours")
           
            }
       
            resetAllObjects()
       
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
        adjustLabel.hidden = true
        dollarLabel.hidden = true
        settingsSet = .None
    }
    
    
    
    func saveObject(object: String) {
        settingsDict.updateValue((settingsField.text as NSString).doubleValue, forKey: object)
        NSUserDefaults.standardUserDefaults().setObject(settingsDict[object], forKey: object)
        resetAllObjects()
    }
    
    
    
    func objectSetup(object: String, enumValue: settingsChoice) {
        let dictLookup = settingsDict[object]!
        adjustLabel.hidden = true
        settingsField.text = "\(dictLookup)"
        settingsField.enabled = true
        saveButton.enabled = true
        dollarLabel.hidden = false
        
        switch enumValue {
        case .Pay:
            settingsLabel.text = "Hourly Pay"
        case .Little:
            settingsLabel.text = "Inner Circle Finishes Every"
        case .BigCircle:
            settingsLabel.text = "Outer Circle Finishes Every"
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
