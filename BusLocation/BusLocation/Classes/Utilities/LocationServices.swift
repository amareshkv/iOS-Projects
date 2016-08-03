//
//  LocationServices.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit
import CoreLocation

let Google_API_Key = "AIzaSyAr4KKhGxowRn9aLZm3gZXz1szYF5Rnk5I"

enum GoogleQuery_Type : NSInteger {
    case ATM
    case Bus_Station
}

class LocationServices: NSObject,CLLocationManagerDelegate {
    
    static let sharedServices = LocationServices()
    
    var locationManager : CLLocationManager?
    var userLocation : CLLocation?
    
    override init() {
        
        super.init()
        
        self.locationManager = CLLocationManager()
        self.locationManager?.distanceFilter = kCLDistanceFilterNone
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.delegate = self
        
        if((self.locationManager?.respondsToSelector(#selector(CLLocationManager.requestWhenInUseAuthorization))) != nil){
            self.locationManager?.requestWhenInUseAuthorization()
        }
        
        self.locationManager?.startUpdatingLocation()
        
    }
    
    
    internal func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        self.userLocation = locations.first
        
        NSNotificationCenter.defaultCenter().postNotificationName(kUserLocationNotification, object: self.userLocation)
        
    }
    
    internal func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        
        
    }
    
    
    //MARK: Google Querys
    
    func queryForType(type : GoogleQuery_Type, block : webServiceCompletionBlock){
        
        var query : String?
        
        switch type {
        case GoogleQuery_Type.ATM:
            query = "atm|ATM"
            break
            
        case GoogleQuery_Type.Bus_Station:
            query = "bus_station"
            break
            
        
        }
        
        if(self.userLocation == nil){
            ///show error alert
            return
        }
        
        LocationWebService.sharedInstance.getQueryResults(query, latitude: Float((self.userLocation?.coordinate.latitude)!), longitude: Float((self.userLocation?.coordinate.longitude)!), radius: 1000, apiKey: Google_API_Key, block: block)
        
        
    }

}
