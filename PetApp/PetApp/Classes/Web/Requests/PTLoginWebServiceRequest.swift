//
//  PTLoginWebServiceRequest.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/2/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import Foundation


class PTLoginWebServiceRequest : PTWebServiceRequest{
    
    
    override init(block:webServiceCompletionBlock) {
        
        super.init(block: block)
        
        self._url = NSURL(string: "https://api.github.com/users/mralexgray/repos")
        
    }
    
    
    override func requestComplete(data : NSData) {
        
        self._block!(data,nil)
        super.requestComplete(data)
    }
    
    
    override func requestFailed(error : NSError){
        
        self._block!(nil,error)
        super.requestFailed(error)
    }
    
    
}