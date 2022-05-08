//
//  ArticleDetails.swift
//  Feedwes
//
//  Created by FV iMAGINATION on 15/09/15.
//  Copyright (c) 2015 FV iMAGINATION. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AudioToolbox
import iAd


class ArticleDetails: UIViewController,
UIWebViewDelegate,
ADBannerViewDelegate,
GADBannerViewDelegate
{

    /* Views */
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var siteTitleLabel: UILabel!
    
    //Ad banners properties
    var iAdBannerView = ADBannerView()
    var adMobBannerView = GADBannerView()
    
    
    
    /* Variables */
    var urlString = ""
    var postTitle = ""
    var journalName = ""
    var mediaURL = ""
    
    var postObj = Post()
    
    

override func viewDidLoad() {
        super.viewDidLoad()

    let url = NSURL(string: urlString)
    webView.loadRequest(NSURLRequest(URL: url!))
    
    // CONSOLE LOGS:
    print("\(urlString)")
    print("\(journalName)")
    print("\(mediaURL)")
    
    
    // Init ad banners
    initiAdBanner()
    initAdMobBanner()
    
}


    
// MARK: - WEBVIEW DELEGATE TO GET THE ARTICLE'S TITLE
func webViewDidFinishLoad(webView: UIWebView) {
    siteTitleLabel.text = webView.stringByEvaluatingJavaScriptFromString("document.title")
}
    
    
    
    
    
// MARK: - TOOLBAR BUTTONS
@IBAction func toolbarButtons(sender: AnyObject) {
    let butt = sender as! UIBarButtonItem
    
    switch butt.tag {
    // Go back
    case 0: webView.goBack();  break
    // Go next
    case 1: webView.goForward();  break
    // Refresh page
    case 2: webView.reload();  break
    // Share page
    case 3:
        let messageStr  = "CHECK THIS NEWS OUT: \(urlString) - found on #\(APP_NAME)"
        let img = UIImage(named: "logo")
        let shareItems = [messageStr, img!]
        
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypePostToVimeo]
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            // iPad
            let popOver = UIPopoverController(contentViewController: activityViewController)
            popOver.presentPopoverFromRect(CGRectZero, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection(), animated: true)
        } else {
            // iPhone
            presentViewController(activityViewController, animated: true, completion: nil)
        }
        break
        
        
        
    default:break }
    
}
    
    

    
    
// MARK: - BACK BUTTON
@IBAction func backButt(sender: AnyObject) {
    navigationController?.popViewControllerAnimated(true)
}

    
    
    
    
    
// MARK: - iAd + AdMob BANNERS
    
    // Initialize Apple iAd banner
    func initiAdBanner() {
        iAdBannerView = ADBannerView(frame: CGRectMake(0, -60, 0, 0) )
        iAdBannerView.delegate = self
        iAdBannerView.hidden = true
        view.addSubview(iAdBannerView)
    }
    
    // Initialize Google AdMob banner
    func initAdMobBanner() {
        adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSizeMake(320, 50))
        adMobBannerView.frame = CGRectMake(0, -60, 320, 50)
        adMobBannerView.adUnitID = ADMOB_BANNER_UNIT_ID
        adMobBannerView.rootViewController = self
        adMobBannerView.delegate = self
        // adMobBannerView.hidden = true
        view.addSubview(adMobBannerView)
        
        let request = GADRequest()
        adMobBannerView.loadRequest(request)
    }
    
    
    // Hide the banner
    func hideBanner(banner: UIView) {
        UIView.beginAnimations("hideBanner", context: nil)
        banner.frame = CGRectMake(0, -60, banner.frame.size.width, banner.frame.size.height)
        UIView.commitAnimations()
        banner.hidden = true
        
    }
    
    // Show the banner
    func showBanner(banner: UIView) {
        UIView.beginAnimations("showBanner", context: nil)
        
        // Move the banner on the bottom of the screen
        banner.frame = CGRectMake(0, 64, banner.frame.size.width, banner.frame.size.height);
        UIView.commitAnimations()
        banner.hidden = false
        
    }
    
    // iAd banner available
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        print("iAd loaded!")
        hideBanner(adMobBannerView)
        showBanner(iAdBannerView)
    }
    
    // NO iAd banner available
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print("iAd can't looad ads right now, they'll be available later")
        hideBanner(iAdBannerView)
        let request = GADRequest()
        adMobBannerView.loadRequest(request)
    }
    
    
    // AdMob banner available
    func adViewDidReceiveAd(view: GADBannerView!) {
        print("AdMob loaded!")
        hideBanner(iAdBannerView)
        showBanner(adMobBannerView)
    }
    
    // NO AdMob banner available
    func adView(view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        print("AdMob Can't load ads right now, they'll be available later \n\(error)")
        hideBanner(adMobBannerView)
    }
    
    

    
    
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
