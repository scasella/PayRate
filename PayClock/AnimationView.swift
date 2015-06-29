//
//  AnimationView.swift
//  PayRate
//
//  Created by Stephen Casella on 6/28/15.
//  Copyright (c) 2015 Stephen Casella. All rights reserved.
//

import UIKit

class AnimationView: UIViewController {
    
    @IBOutlet var animationView: FallingCoinsView!
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
             animationView.addCoinDropLongAnimation()
    }
    
    
}
