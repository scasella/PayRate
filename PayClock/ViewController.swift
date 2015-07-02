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
    @IBOutlet var cashOutbutton: UIButton!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var progressViewTwo: ProgressViewTwo!
    @IBOutlet var progressView: ProgressView!
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAnimation" {
    progressView.hidden = true
    progressViewTwo.hidden = true
        }}
  
    enum buttonEnum {
        
        case EmptyResume
        case Paused
        case UnLoad
        
    }
    
    var buttonState = buttonEnum.EmptyResume
    
    @IBAction func buttonPressed (sender: AnyObject) {
        switch buttonState  {
        case .EmptyResume:
            buttonState = .Paused
            setupGame()
            subtractTime()
            progressView.animateProgressView()
            progressViewTwo.animateProgressView()
            //coinBag.hidden = false
            //coinBagLabel.hidden = false
        case .Paused:
            blueLabel.text = "Cash out?"
            //MAKE 'YES' 'NO' BUTTONS VISIBLE
            timer.invalidate()
        case .UnLoad:
            buttonState = .EmptyResume
            totalHours += seconds / 60
            seconds = 0.0
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

