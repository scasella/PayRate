//
//  ViewController.swift
//  PayClock
//
//  Created by Stephen Casella on 6/16/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit
import QuartzCore

var hourlyRate: Double = 0.00
var secondRate = hourlyRate / 60 / 60

class ViewController: UIViewController {

    @IBOutlet var hourlyField: UITextField!
    @IBOutlet var money: UILabel!
    @IBOutlet var stopped: UILabel!
    
    @IBOutlet var progressViewTwo: ProgressViewTwo!
    @IBOutlet var progressView: ProgressView!
    
    @IBAction func setHourlyRate(sender: AnyObject) {
        hourlyRate = (hourlyField.text as NSString).doubleValue
        secondRate = hourlyRate / 60 / 60
        progressView.animateProgressView()
        progressViewTwo.animateProgressView()
    }
      var count = 0
    var seconds = 0.00
    var timer = NSTimer()
    var payrate = 23.00/60.00/60.00*0.1
    
    
    override func viewDidLoad() {

           }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGame() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
    }
    
    func subtractTime() {
        seconds++
        money.text = "$\(Float(round(seconds * payrate * 10000) / 10000))"}
    
    
  
}

