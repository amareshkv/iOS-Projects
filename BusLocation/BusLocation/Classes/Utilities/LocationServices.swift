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
    case Pharmacy
    case Restaurant
    case Travel_Agency
    case Cafe
    case Bank
    case Bar
    case Laundry
    case Bakery
    case Spa
    case Police
    case Doctor
    case Subway_station
    case Park
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
        case .ATM:
            query = "atm|ATM"
            break
            
        case .Bus_Station:
            query = "bus_station"
            break
            
        case .Pharmacy:
            query = "pharmacy"
            break
            
        case .Restaurant:
            query = "restaurant"
            break
            
        case .Travel_Agency:
            query = "travel_agency"
            break
            
        case .Cafe:
            query = "cafe"
            break
            
        case .Bank:
            query = "bank"
            break
            
        case .Bar:
            query = "bar"
            break
            
        case .Laundry:
            query = "laundry"
            
        case .Bakery:
            query = "bakery"
            break
            
        case .Spa:
            query = "spa"
            break
            
        case .Police:
            query = "police"
            break
            
        case .Doctor:
            query = "doctor"
            break
            
        case .Subway_station:
            query = "subway_station"
            break
            
        case .Park:
            query = "park"
            break
            
        default:
            break
            
        
        }
        
        if(self.userLocation == nil){
            ///show error alert
            return
        }
        
        LocationWebService.sharedInstance.getQueryResults(query, latitude: Float((self.userLocation?.coordinate.latitude)!), longitude: Float((self.userLocation?.coordinate.longitude)!), radius: 1000, apiKey: Google_API_Key, block: block)
        
        
    }

}
