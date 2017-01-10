//
//  AdServices.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 09/01/17.
//  Copyright © 2017 Amaresh K V. All rights reserved.
//

import UIKit
import GoogleMobileAds

let startAppID = "200633817"
let startAccountID = "103404835"

let admobAppID = "ca-app-pub-5021783510483777/7364339046"

protocol AdServicesProtocol {
    
    var startAppBanner: STABannerView? {get set}
    var isBannerAdLoaded : Bool? {get set}
}

class AdServices: NSObject,AdServicesProtocol {
   
    internal var isBannerAdLoaded: Bool?

    internal var startAppBanner: STABannerView?
    
    var bannerView: GADBannerView?

    static let sharedServices : AdServices = {
        
        let instance = AdServices()
        return instance
    }()
    
    required override init() {
        
    }
    
    func preLoadAds(){
        
        let sdk = STAStartAppSDK.sharedInstance()
        sdk?.appID = startAppID
        sdk?.devID = startAccountID
    }
    
    //MARK StartApp ads
    
    public func showSplashAd(){
        let sdk = STAStartAppSDK.sharedInstance()
        sdk?.showSplashAd(withDelegate: self)
    }
    
    public func showBannerAds(controller : UIViewController){

        if (startAppBanner == nil) {
            startAppBanner = STABannerView(size: STA_AutoAdSize, autoOrigin: STAAdOrigin_Bottom, with: controller.view, withDelegate: self);
            controller.view.addSubview(startAppBanner!)
        }
        
        GADMobileAds.configure(withApplicationID: admobAppID)
        
        self.bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait, origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height - 50))
        bannerView?.delegate = self
        bannerView?.adUnitID = admobAppID
        bannerView?.rootViewController = controller
        controller.view.addSubview(bannerView!)
        //showAdmobBanner()
        
    }
    
    public func showAdmobBanner(){
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        bannerView?.load(request)
    }
    
    public func hideAdmobBanner(){
        
        bannerView?.load(nil)
    }
    
}


extension AdServices : STABannerDelegateProtocol{
    
    func didDisplayBannerAd(_ banner: STABannerView!) {
        print("display banner success")
        
        hideAdmobBanner()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotification_didDisplayBannerAd), object: nil)
        self.isBannerAdLoaded = true
    }
    
    func failedLoadBannerAd(_ banner: STABannerView!, withError error: Error!) {
        print("display banner error")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotification_didFailedToDisplayBannerAd), object: nil)
        self.isBannerAdLoaded = false
        
        showAdmobBanner()
    }
    
    func didClickBannerAd(_ banner: STABannerView!) {
        print("click banner success")
    }
    
}

extension AdServices : STADelegateProtocol{
    
    func didLoad(_ ad: STAAbstractAd!) {
        print("load success")
    }
    
    func didShow(_ ad: STAAbstractAd!) {
        print("show success")
    }
    
    func failedLoad(_ ad: STAAbstractAd!, withError error: Error!) {
        print("load error = \(error)")
    }
    
    func failedShow(_ ad: STAAbstractAd!, withError error: Error!) {
        print("show error = \(error)")
    }
}

extension AdServices : GADBannerViewDelegate{
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("display admob banner success")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotification_didDisplayBannerAd), object: nil)
        self.isBannerAdLoaded = true
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("display admob banner error")
        if error.code != 0{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotification_didFailedToDisplayBannerAd), object: nil)
            self.isBannerAdLoaded = false
        }
        //
    }

    
}

