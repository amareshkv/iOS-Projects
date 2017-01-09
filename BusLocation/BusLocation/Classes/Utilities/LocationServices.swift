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
    case atm
    case bus_Station
    case pharmacy
    case restaurant
    case travel_Agency
    case cafe
    case bank
    case bar
    case laundry
    case bakery
    case spa
    case police
    case doctor
    case subway_station
    case park
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
        
        if((self.locationManager?.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization))) != nil){
            self.locationManager?.requestWhenInUseAuthorization()
        }
        
        self.locationManager?.startUpdatingLocation()
        
    }
    
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        self.userLocation = locations.first
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: kUserLocationNotification), object: self.userLocation)
        
    }
    
    internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        
        
    }
    
    
    //MARK: Google Querys
    
    func queryForType(_ type : GoogleQuery_Type, block : @escaping webServiceCompletionBlock){
        
        var query : String?
        
        switch type {
        case .atm:
            query = "atm|ATM"
            break
            
        case .bus_Station:
            query = "bus_station"
            break
            
        case .pharmacy:
            query = "pharmacy"
            break
            
        case .restaurant:
            query = "restaurant"
            break
            
        case .travel_Agency:
            query = "travel_agency"
            break
            
        case .cafe:
            query = "cafe"
            break
            
        case .bank:
            query = "bank"
            break
            
        case .bar:
            query = "bar"
            break
            
        case .laundry:
            query = "laundry"
            
        case .bakery:
            query = "bakery"
            break
            
        case .spa:
            query = "spa"
            break
            
        case .police:
            query = "police"
            break
            
        case .doctor:
            query = "doctor"
            break
            
        case .subway_station:
            query = "subway_station"
            break
            
        case .park:
            query = "park"
            break
            
       
        
        }
        
        if(self.userLocation == nil){
            ///show error alert
            return
        }
        
        LocationWebService.sharedInstance.getQueryResults(query, latitude: Float((self.userLocation?.coordinate.latitude)!), longitude: Float((self.userLocation?.coordinate.longitude)!), radius: 1000, apiKey: Google_API_Key, block: block)
        
        
    }

}
