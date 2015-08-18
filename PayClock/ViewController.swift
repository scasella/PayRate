//
//  ViewController.swift
//  PayClock
//
//  Created by Stephen Casella on 6/16/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit
import iAd


var buttonState = buttonEnum.ToStartOrResume
var secondRate = settingsDict["PayRate"]! / 60 / 60
var blueLabelValue = 0.00
var seconds = 0.00
var totalPay = 0.00
var totalHours = 0.00
var newSeconds = 0.00

enum buttonEnum {
    case ToStartOrResume
    case ToPaused
    case ToResume
}


class ViewController: UIViewController {
    
    var toggleTimer = false
    var timer = NSTimer()

    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var cashOutbutton: UIButton!
    @IBOutlet var totalPayLabel: UILabel!
    @IBOutlet var totalHoursLabel: UILabel!
    @IBOutlet var startButton: SpringButton!

    @IBOutlet var outerCircleUI: CircularProgressView!
    @IBOutlet var innerCircleUI: CircularProgressView!
    @IBOutlet var settingsIcon: UIButton!
    @IBOutlet var bottomBG: UIImageView!
    @IBOutlet var adBanner: ADBannerView!

    

    @IBAction func set(sender: AnyObject) {
        settingsIcon.setBackgroundImage(UIImage(named: "SettingsButtonF.png"), forState: UIControlState.Normal)
    }
    
    
    
    @IBAction func cashOut(sender: AnyObject) {
        blueLabel.hidden = true
        startButton.setBackgroundImage(UIImage(named: "CoinImage.png"), forState: UIControlState.Normal)
        startButton.force = 0.8
        startButton.duration = 2.0
        startButton.animation = "fadeIn"
        startButton.animate()
        addTime(totalPay, newSecs: seconds, secondRate: secondRate)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSettings" {
            settingsIcon.hidden = true
            adBanner.hidden = true
    }}

    
    
    @IBAction func buttonPressed (sender: AnyObject) {
        switch buttonState  {
        case .ToStartOrResume:
            buttonState = .ToPaused
             NSUserDefaults.standardUserDefaults().setObject(savedTime, forKey: "buttonState")
            cashOutbutton.hidden = true
            settingsIcon.hidden = true
            setupGame()
            subtractTime()
            toggleSaveTime = true
            //progressView.animateProgressView()
            //progressViewTwo.animateProgressView()
            //coinBag.hidden = false
            //coinBagLabel.hidden = false
        case .ToPaused:
            buttonState = .ToResume
            blueLabel.text = "Paused"
            cashOutbutton.hidden = false
            settingsIcon.hidden = false
            toggleSaveTime = false
            buttonState = .ToStartOrResume
            //progressView.progressLayer.strokeEnd = 0.3
            timer.invalidate()
        case .ToResume:
            subtractTime()
            buttonState = .ToPaused
            toggleSaveTime = true 
            
        }
    }

    
    
    override func viewDidLoad() {
        
       /* if buttonState == .ToPaused {
            progressView.animateProgressView()
            progressViewTwo.animateProgressView()
        }*/
       
        canDisplayBannerAds = true
        
        if NSUserDefaults.standardUserDefaults().objectForKey("PayRate") != nil {
            settingsDict["PayRate"] = NSUserDefaults.standardUserDefaults().objectForKey("PayRate") as! Double!
        }
        secondRate = settingsDict["PayRate"]! / 60 / 60
        
        if NSUserDefaults.standardUserDefaults().objectForKey("totalPay") != nil {
            totalPay = NSUserDefaults.standardUserDefaults().objectForKey("totalPay") as! Double
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("totalHours") != nil {
            totalHours = NSUserDefaults.standardUserDefaults().objectForKey("totalHours") as! Double
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("secondRate") != nil {
            totalPay = NSUserDefaults.standardUserDefaults().objectForKey("secondRate") as! Double
        }
     totalHoursLabel.text = "\(round(totalHours * 100)/100)"
     totalPayLabel.text = "$\(round(totalPay * 100)/100)"
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setupGame() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
    }
    
    
    
    func addTime(tPay: Double, newSecs: Double, secondRate: Double) -> Void {
        var totalAdd = blueLabelValue
        var totalAddHours = newSecs / 60 / 60
        totalPay = totalPay + totalAdd
        totalHours = totalHours + totalAddHours
        NSUserDefaults.standardUserDefaults().setObject(totalPay, forKey: "totalPay")
        NSUserDefaults.standardUserDefaults().setObject(totalHours, forKey: "totalHours")
        totalHoursLabel.text = "\(round(totalHours * 100)/100)"
        totalPayLabel.text = "$\(round(totalPay * 100)/100)"
        totalAdd = 0.00
        totalAddHours = 0.00
        seconds = 0.00
        blueLabelValue = 0.00
        buttonState = .ToStartOrResume
        blueLabel.text = "Start"
        cashOutbutton.hidden = true
        settingsIcon.hidden = false
        seconds = 0.0
        innerCircleUI.value = 0.0
        outerCircleUI.value = 0.0
    }

    
    
    func subtractTime() {
        seconds += 0.1
        var innerCounter = CGFloat(seconds * secondRate / settingsDict["LittleCircle"]! % settingsDict["LittleCircle"]!)
        var outerCounter = CGFloat(seconds * secondRate / settingsDict["BigCircle"]! % settingsDict["BigCircle"]!)
        innerCircleUI.value = innerCounter
        outerCircleUI.value = outerCounter
        if  innerCircleUI.value % 1 >= 1.0 {
            //progressView.progressLayer.strokeStart = 0.0
            innerCircleUI.value = 0.0
        }
        if outerCircleUI.value % 1 >= 1.0 {
           // progressViewTwo.progressLayer.strokeStart = 0.0
            outerCircleUI.value = 0.0
        }
        blueLabelValue =  Double(round(secondRate * seconds * 100)/100)
        blueLabel.text = "$\(Double(round(secondRate * seconds * 100)/100))"
     /*   if seconds * secondRate % settingsDict["LittleCircle"]! == 0 {
            progressView.animateProgressView() }
        if seconds * secondRate % settingsDict["BigCircle"]! == 0 {
            progressViewTwo.animateProgressView() } */
    }
}

