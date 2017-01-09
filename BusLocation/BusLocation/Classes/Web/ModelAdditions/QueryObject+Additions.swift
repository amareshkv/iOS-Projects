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
    
    
    class func queryObjectWithAttributes(_ attributes : NSDictionary?, moc : NSManagedObjectContext?) -> QueryObject{
        
        let entity = QueryObject(attributes: attributes, moc: moc)
        return entity
        
    }
    
    
    convenience init(attributes : NSDictionary?, moc : NSManagedObjectContext?){
        
        self.init(entity: NSEntityDescription.entity(forEntityName: "QueryObject", in: moc!)!, insertInto: moc!)
        
        let geometry = attributes?.value(forKey: "geometry") as? NSDictionary
        
        let location = geometry?.value(forKey: "location") as? NSDictionary
        
        self.latitude = NSNumber(value: ((location?.value(forKey: "lat") as AnyObject).floatValue)! as Float)
        self.longitude = NSNumber(value: ((location?.value(forKey: "lng") as AnyObject).floatValue)! as Float)
        
        self.iconURL = attributes?.stringForKey("icon")
        self.idString = attributes?.stringForKey("id")
        
        self.name = attributes?.stringForKey("name")
        self.place_id = attributes?.stringForKey("place_id")
        self.vicinity = attributes?.stringForKey("vicinity")
        
        
        
    }
    
}
