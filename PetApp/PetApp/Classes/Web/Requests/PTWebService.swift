//
//  PTWebService.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 1/28/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

class PTWebService: NSObject,NSURLSessionDelegate {
    
    
    class var sharedInstance: PTWebService {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: PTWebService? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = PTWebService()
        }
        return Static.instance!
    }
//    
//    override init() {
//        super.init()
//        
//    }
    

}
