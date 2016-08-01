//
//  QueryObject+CoreDataProperties.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 01/08/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension QueryObject {

    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var iconURL: String?
    @NSManaged var idString: String?
    @NSManaged var name: String?
    @NSManaged var vicinity: String?
    @NSManaged var place_id: String?

}
