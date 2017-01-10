//
//  BaseViewController.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit


let kNotification_didDisplayBannerAd = "notification.diddisplaybannerad"
let kNotification_didFailedToDisplayBannerAd = "notification.didFailedToLoadBannerAd"

class BaseViewController: UIViewController {
    
    @IBOutlet weak var headingLabel : UILabel?
    
    @IBOutlet weak var topBar : UIView?
    
    @IBOutlet weak var adViewHeightConstraint : NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel?.fontForDevice()
        topBar?.backgroundColor = UIColor.colorForHex("#00B7F7")
        topBar?.addLowerShadowToViewWithRadius(1, color: UIColor.black)

        
        initialiseBannerAds()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

var AssociatedObjectHandle: UInt8 = 0

extension BaseViewController : AdServicesProtocol{
    
    

    internal var isBannerAdLoaded: Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as? Bool

        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        }
    }

    internal var startAppBanner: STABannerView? {
        get {
            return objc_getAssociatedObject(self, nil) as? STABannerView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    
    func initialiseBannerAds(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.didDisplayBannerAd(notification:)), name: NSNotification.Name(rawValue: kNotification_didDisplayBannerAd), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.didFailedToLoadBannerAd(notification:)), name: NSNotification.Name(rawValue: kNotification_didFailedToDisplayBannerAd), object: nil)
        
        if let banneradloaded = isBannerAdLoaded{
            if banneradloaded == true{
                didDisplayBannerAd(notification: nil)
            }
            else{
                didFailedToLoadBannerAd(notification: nil)
            }
        }
        
    }
    
    func didDisplayBannerAd(notification : Notification?){
        
        adViewHeightConstraint?.constant = 50
    }
    
    
    func didFailedToLoadBannerAd(notification : Notification?){
        
        adViewHeightConstraint?.constant = 0
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation)  {
        // notify StartApp auto Banner orientation change
        startAppBanner!.didRotate(from: fromInterfaceOrientation)
        super.didRotate(from: fromInterfaceOrientation)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // notify StartApp auto Banner orientation change
        startAppBanner!.viewWillTransition(to: size, with: coordinator)
        
        super.viewWillTransition(to: size, with: coordinator)
    }
    
}


