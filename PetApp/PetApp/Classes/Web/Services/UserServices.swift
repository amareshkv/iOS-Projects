//
//  UserServices.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/2/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import Foundation


typealias webServiceCompletionBlock = ((AnyObject?,NSError?)->Void)


class UserServices : NSObject{
    
    class var sharedInstance: UserServices {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: UserServices? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = UserServices()
        }
        return Static.instance!
    }
    
    
    func loginUserWithCredentials(username : NSString, password: NSString, block: webServiceCompletionBlock){
        
        let request : PTLoginWebServiceRequest? = PTLoginWebServiceRequest(block: block)
        request!.start()
    }
    
}
