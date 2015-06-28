//
//  ViewController.swift
//  PayClock
//
//  Created by Stephen Casella on 6/16/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit
import QuartzCore

var secondRate = settingsDict["PayRate"]! / 60 / 60
var seconds:Double = 0.00
var totalPay = 0.0
var totalHours = 0.0

class ViewController: UIViewController {
    
    var toggleTimer = false
    var timer = NSTimer()

    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var hourlyField: UITextField!
    @IBOutlet var money: UILabel!
    @IBOutlet var stopped: UILabel!
    @IBOutlet var cashOutbutton: UIButton!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var coinBagLabel: UILabel!
    @IBOutlet var coinBag: UIImageView!
    @IBOutlet var progressViewTwo: ProgressViewTwo!
    @IBOutlet var progressView: ProgressView!
    
    
    
    @IBAction func setHourlyRate(sender: AnyObject) {
        if toggleTimer  == false {
            toggleTimer = true
            setupGame()
            subtractTime()
            progressView.animateProgressView()
            progressViewTwo.animateProgressView()
            cashOutbutton.hidden = true
            //coinBag.hidden = false
            //coinBagLabel.hidden = false
        } else {
            toggleTimer = false
            coinBag.hidden = true
            coinBagLabel.hidden = true
            cashOutbutton.hidden = false
            timer.invalidate()
        }
    }
    
    
    
    override func viewDidLoad() {

           }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setupGame() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
    }
    
    
    
    func subtractTime() {
        seconds++
        blueLabel.text = "$\(Double(round(secondRate * seconds * 100)/100))"}
}

