//
//  PetServices.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 1/28/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

class PetServices: NSObject {
    
    class var sharedInstance: PetServices {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: PetServices? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = PetServices()
        }
        return Static.instance!
    }
    
    
    func getPetsInfo(username : NSString, block: webServiceCompletionBlock){
        
        let request = PTGetPetsWebServiceRequest(block: block)
        request.start()

    }
    
    
}
