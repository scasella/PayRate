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
var seconds = 0.00
var totalPay = 0.00
var totalHours = 0.00
var newSeconds = 0.00

class ViewController: UIViewController {
    
    var toggleTimer = false
    var timer = NSTimer()

    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var cashOutbutton: UIButton!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var progressViewTwo: ProgressViewTwo!
    @IBOutlet var progressView: ProgressView!
    @IBOutlet var settingsIcon: UIButton!
    @IBOutlet var bagIcon: UIButton!
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAnimation" {
    settingsIcon.hidden = true
    bagIcon.hidden = true
    buttonState = .EmptyResume
    newSeconds = seconds 
    seconds = 0.0
    progressView.hidden = true
    progressViewTwo.hidden = true
        } else if segue.identifier == "toSettings" {
    settingsIcon.hidden = true
        }
    
    }
    
  
    
    enum buttonEnum {
        
        case EmptyResume
        case Paused
        
    }
    
    var buttonState = buttonEnum.EmptyResume
    
    @IBAction func buttonPressed (sender: AnyObject) {
        switch buttonState  {
        case .EmptyResume:
            buttonState = .Paused
            cashOutbutton.hidden = true
            settingsIcon.hidden = true
            setupGame()
            subtractTime()
            progressView.animateProgressView()
            progressViewTwo.animateProgressView()
            //coinBag.hidden = false
            //coinBagLabel.hidden = false
        case .Paused:
            blueLabel.text = "Paused"
            cashOutbutton.hidden = false
            settingsIcon.hidden = false
            buttonState = .EmptyResume
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

