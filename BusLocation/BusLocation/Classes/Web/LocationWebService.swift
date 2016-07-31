//
//  PTWebService.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 1/28/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

typealias webServiceCompletionBlock = ((AnyObject?,NSError?)->Void)


class LocationWebService: NSObject,NSURLSessionDelegate {
    
    
    class var sharedInstance: LocationWebService {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: LocationWebService? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = LocationWebService()
        }
        return Static.instance!
    }
    
    func startRequest(request : LocationWebServiceRequest){
        
        request.setUpRequestAndStart()
        
    }
    
    func endRequest(request : LocationWebServiceRequest){
        
        //request
    }
    
//    
//    override init() {
//        super.init()
//        
//    }
    

}

extension LocationWebService{
    
    func getQueryResults(query : String?, latitude : Float, longitude : Float, radius : Float, apiKey : String?, block : webServiceCompletionBlock){
        
        let service  = LocationWebServiceRequestGetQuery(target: self, query: query, latitude: latitude, longitude: longitude, radius: radius, apiKey: apiKey, block: block)
        self.performSelector(#selector(LocationWebService.startRequest(_:)), withObject: service)
        
    }
    
}
