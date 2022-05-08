//
//  Configs.swift
//  Feedwes
//
//  Created by FV iMAGINATION on 15/09/15.
//  Copyright (c) 2015 FV iMAGINATION. All rights reserved.
//

import Foundation
import UIKit


// CHANGE THE RED NAME BELOW ACCORDINGLY TO THE NBAME YOU'LL GIVE TO YOUR OWN VERSION OF THIS APP
let APP_NAME = "Feedews"

// REPLACE THE RED STRING BELOW WITH YOUR OWN ADMOB BANNER UNIT ID (get it from http://apps.admob.com)
let ADMOB_BANNER_UNIT_ID = "ca-app-pub-9733347540588953/7805958028"


// NEWS CATEGORIES ARRAY -> Please note that if you'll add a Category here, you will have to add the same Category into RSSlist.plist file as an 'Array'
let categoriesArray = [
    "World",
    "Politics",
    "Lifestyle",
    "U.S.",
    "Business",
    "Technology",
    "Science",
    "Entertainment",
    "Health",
    "Sport",
    
]




// COLORS ARRAY (for Category buttons)
let colorsArray = [
UIColor(red: 237.0/255.0, green: 85.0/255.0, blue: 100.0/255.0, alpha: 1.0),
UIColor(red: 250.0/255.0, green: 110.0/255.0, blue: 82.0/255.0, alpha: 1.0),
UIColor(red: 255.0/255.0, green: 207.0/255.0, blue: 85.0/255.0, alpha: 1.0),
UIColor(red: 72.0/255.0, green: 207.0/255.0, blue: 174.0/255.0, alpha: 1.0),
UIColor(red: 150.0/255.0, green: 123.0/255.0, blue: 220.0/255.0, alpha: 1.0),
UIColor(red: 218.0/255.0, green: 69.0/255.0, blue: 83.0/255.0, alpha: 1.0),
UIColor(red: 204.0/255.0, green: 208.0/255.0, blue: 217.0/255.0, alpha: 1.0),
UIColor(red: 198.0/255.0, green: 156.0/255.0, blue: 109.0/255.0, alpha: 1.0),
UIColor(red: 237.0/255.0, green: 85.0/255.0, blue: 100.0/255.0, alpha: 1.0),
UIColor(red: 250.0/255.0, green: 110.0/255.0, blue: 82.0/255.0, alpha: 1.0),
UIColor(red: 255.0/255.0, green: 207.0/255.0, blue: 85.0/255.0, alpha: 1.0),
UIColor(red: 72.0/255.0, green: 207.0/255.0, blue: 174.0/255.0, alpha: 1.0),
UIColor(red: 204.0/255.0, green: 208.0/255.0, blue: 217.0/255.0, alpha: 1.0),
UIColor(red: 198.0/255.0, green: 156.0/255.0, blue: 109.0/255.0, alpha: 1.0),
]

    
    


// HUD View
let hudView = UIView(frame: CGRectMake(0, 0, 80, 80))
let indicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 80, 80))
let spinImage = UIImageView(frame: CGRectMake(0, 0, 80, 80))
extension UIView {
    func showHUD(view: UIView) {
        hudView.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2)
        hudView.backgroundColor = UIColor(red: 93.0/255.0, green: 155.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        hudView.alpha = 0.9
        hudView.layer.cornerRadius = hudView.bounds.size.width/2
        
        indicatorView.center = CGPointMake(hudView.frame.size.width/2, hudView.frame.size.height/2)
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        hudView.addSubview(indicatorView)
        indicatorView.startAnimating()
        view.addSubview(hudView)
    }
    func hideHUD(view: UIView) {
        hudView.removeFromSuperview()
    }
}





// EXTENSION TO SHUFFLE AN ARRAY (do not edit this code!)
extension Array {
    mutating func shuffle() {
        for _ in 0..<10 /*self.count*/ {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}







