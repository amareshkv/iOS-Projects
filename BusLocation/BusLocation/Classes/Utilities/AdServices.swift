//
//  AdServices.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 09/01/17.
//  Copyright © 2017 Amaresh K V. All rights reserved.
//

import UIKit

let startAppID = "200633817"
let startAccountID = "103404835"

class AdServices: NSObject,STADelegateProtocol {
    
    static let sharedServices : AdServices = {
        
        let instance = AdServices()
        return instance
    }()
    
    override init() {
        super.init()
        
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
