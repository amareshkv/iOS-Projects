//
//  PTLoginWebServiceRequest.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/2/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import Foundation


class LocationWebServiceRequestGetQuery : LocationWebServiceRequest{
    
    
    init(target : Any?, query : String?, latitude : Float, longitude : Float, radius : Float, apiKey : String?, block:@escaping webServiceCompletionBlock) {
        
        super.init(block: block)
        
        let urlString : String = "https://maps.googleapis.com/maps/api/place/search/json?location=\(latitude),\(longitude)&radius=\(radius)&types=\(query!)&sensor=true&key=\(apiKey!)"
        //let urlstr : String = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)!
        let urlStr : String = urlString.addingPercentEscapes(using: String.Encoding.utf8)!

        
        self._url = URL(string: urlStr)
        print("\(_url)")
        
    }
    
    
    override func requestComplete(_ data : Data?) {
        
        OperationQueue.main.addOperation { () -> Void in
            
            var array = [QueryObject]()
            
            weak var context = LocationStorage.sharedStorage.moc
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
            print("\(json!)")
            let results = json?.arrayForKey("results")
            
            for attributes in results!{
                
                let entity = QueryObject(attributes: attributes as? NSDictionary, moc: context)
                array.append(entity)
                
            }
            
            self._block!(array as AnyObject?,nil)
        };
        
        super.requestComplete(data!)
    }
    
    
    override func requestFailed(_ error : Error?){
        
        OperationQueue.main.addOperation { () -> Void in
            self._block!(nil,error)
        };
        super.requestFailed(error)
    }
    
    
}
