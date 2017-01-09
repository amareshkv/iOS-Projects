//
//  PTWebService.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 1/28/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

typealias webServiceCompletionBlock = ((AnyObject?,Error?)->Void)


class LocationWebService: NSObject,URLSessionDelegate {
    
    
    static let sharedInstance: LocationWebService = LocationWebService()
    
    func startRequest(_ request : LocationWebServiceRequest){
        
        request.setUpRequestAndStart()
        
    }
    
    func endRequest(_ request : LocationWebServiceRequest){
        
        //request
    }
    
//    
//    override init() {
//        super.init()
//        
//    }
    

}

extension LocationWebService{
    
    func getQueryResults(_ query : String?, latitude : Float, longitude : Float, radius : Float, apiKey : String?, block : @escaping webServiceCompletionBlock){
        
        let service  = LocationWebServiceRequestGetQuery(target: self, query: query, latitude: latitude, longitude: longitude, radius: radius, apiKey: apiKey, block: block)
        self.perform(#selector(LocationWebService.startRequest(_:)), with: service)
        
    }
    
}
