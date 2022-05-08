//
//  Intro.swift
//  Feedwes
//
//  Created by FV iMAGINATION on 16/09/15.
//  Copyright (c) 2015 FV iMAGINATION. All rights reserved.
//

import UIKit


class Intro: UIViewController {

    /* Views */
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var readButt: UIButton!
    
    
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()

    // Round views corners
    logoImg.layer.cornerRadius = 20
    logoImg.layer.borderColor = UIColor.lightGrayColor().CGColor
    logoImg.layer.borderWidth = 0.5
    readButt.layer.cornerRadius = 6
    
    // Place containerView in the middle of the screen
    containerView.center = view.center
}

  
    
// MARK: - READ NEWS BUTTON
@IBAction func readNewsButt(sender: AnyObject) {
    view.showHUD(view)
    NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "goToHomeVC", userInfo: nil, repeats: false)
}

 
func goToHomeVC() {
    let homeVC = storyboard?.instantiateViewControllerWithIdentifier("Home") as! Home
    navigationController?.pushViewController(homeVC, animated: true)
}

    
// Remove HUD View
override func viewDidDisappear(animated: Bool) {
    view.hideHUD(view)
}
    
    
    
    
    
    
    
    
    
    
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
