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
        
        let urlString : String = "https://maps.googleapis.com/maps/api/place/search/json?location=\(latitude),\(longitude)&radius=\(radius)&types=\(query!)&sensor=true&key=\(apiKey!)"
        let urlStr : String = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!

        
        self._url = NSURL(string: urlStr)
        print("\(_url)")
        
    }
    
    
    override func requestComplete(data : NSData?) {
        
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            
            var array = [QueryObject]()
            
            weak var context = LocationStorage.sharedStorage.moc
            
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary
            print("\(json!)")
            let results = json?.arrayForKey("results")
            
            for attributes in results!{
                
                let entity = QueryObject(attributes: attributes as? NSDictionary, moc: context)
                array.append(entity)
                
            }
            
            self._block!(array,nil)
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