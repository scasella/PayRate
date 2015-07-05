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
        animationView.addCoinDropLongAnimation()
        addTime(totalPay, newSecs: newSeconds, secondRate: secondRate)
       totalPayLabel.hidden = false 
        totalPayLabel.text = "$\(totalPay)"
    }
    
    
    
    func addTime(tPay: Double, newSecs: Double, secondRate: Double) -> Void {
        var totalAdd = round(newSecs * secondRate * 100) / 100
        totalPay = totalPay + totalAdd
        
    }
    
    
    
    override func viewDidDisappear(animated: Bool) {
        self.dismissViewControllerAnimated(true, completion: nil)
        }
}
