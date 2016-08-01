//
//  QueryObject+Additions.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 01/08/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import Foundation
import CoreData

extension QueryObject{
    
    
    class func queryObjectWithAttributes(attributes : NSDictionary?, moc : NSManagedObjectContext?) -> QueryObject{
        
        let entity = QueryObject(attributes: attributes, moc: moc)
        return entity
        
    }
    
    
    convenience init(attributes : NSDictionary?, moc : NSManagedObjectContext?){
        
        self.init(entity: NSEntityDescription.entityForName("QueryObject", inManagedObjectContext: moc!)!, insertIntoManagedObjectContext: moc!)
        
        let geometry = attributes?.valueForKey("geometry") as? NSDictionary
        
        let location = geometry?.valueForKey("location") as? NSDictionary
        
        self.latitude = NSNumber(float: (location?.valueForKey("lat")?.floatValue)!)
        self.longitude = NSNumber(float: (location?.valueForKey("lng")?.floatValue)!)
        
        self.iconURL = attributes?.stringForKey("icon")
        self.idString = attributes?.stringForKey("id")
        
        self.name = attributes?.stringForKey("name")
        self.place_id = attributes?.stringForKey("place_id")
        self.vicinity = attributes?.stringForKey("vicinity")
        
        
        
    }
    
}
