//
//  AnimationView.swift
//  PayRate
//
//  Created by Stephen Casella on 6/28/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

class AnimationView: UIViewController {
    
    @IBOutlet var totalPayLabel: UILabel!
    
    @IBOutlet var animationView: FallingCoinsView!
    
    override func viewDidLoad() {
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        addTime(totalPay, newSecs: newSeconds, secondRate: secondRate)
        animationView.addCoinDropLongAnimation { (Bool) in
            self.totalPayLabel.text = "$\(totalPay)"
            self.totalPayLabel.hidden = false
        }
    }
    
    
    
    func addTime(tPay: Double, newSecs: Double, secondRate: Double) -> Void {
        var totalAdd = round(newSecs * secondRate * 100) / 100
        var totalAddHours = round(newSecs / 60 / 60 * 100) / 100
        totalPay = totalPay + totalAdd
        totalHours = totalHours + totalAddHours
        NSUserDefaults.standardUserDefaults().setObject(totalPay, forKey: "totalPay")
        NSUserDefaults.standardUserDefaults().setObject(totalHours, forKey: "totalHours")
        
    }
    
    
    
    override func viewDidDisappear(animated: Bool) {
        self.dismissViewControllerAnimated(true, completion: nil)
        }
}
