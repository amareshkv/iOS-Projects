//
//  PTLoginWebServiceRequest.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/2/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import Foundation


class LocationWebServiceRequestGetQuery : LocationWebServiceRequest{
    
    
    init(target : Any?, query : String?, latitude : Float, longitude : Float, radius : Float, apiKey : String?, block:webServiceCompletionBlock) {
        
        super.init(block: block)
        
        let urlString = "https://maps.googleapis.com/maps/api/place/search/json?location=\(latitude),\(longitude)&radius=\(radius)&types=\(query!)&sensor=true&key=\(apiKey!)"
        
        
        self._url = NSURL(string: urlString)
        
    }
    
    
    override func requestComplete(data : NSData?) {
        
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
            
            self._block!(json,nil)
        };
        
        super.requestComplete(data!)
    }
    
    
    override func requestFailed(error : NSError){
        
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            self._block!(nil,error)
        };
        super.requestFailed(error)
    }
    
    
}