//
//  LocationStorage.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 01/08/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit
import CoreData

class LocationStorage: NSObject {
    
    var moc : NSManagedObjectContext?
    var persistentStoreCoordinator : NSPersistentStoreCoordinator?
    var managedObjectModel : NSManagedObjectModel?
    
    
    class var sharedStorage: LocationStorage {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: LocationStorage? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = LocationStorage()
        }
        return Static.instance!
    }
    
    
    
    func applicationDocumentsDirectory() -> NSURL?{
        
        return NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last
    }
    
    func startCoreData(){
        
        let path = NSBundle.mainBundle().pathForResource("DataModel", ofType: "momd");
        let momURL = NSURL.fileURLWithPath(path!);
        
        self.managedObjectModel = NSManagedObjectModel(contentsOfURL: momURL);
        
        self.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel!);
        
        let storeURL = self.applicationDocumentsDirectory()?.URLByAppendingPathComponent("database.sqlite");
        
        // handle db upgrade
        
        let options =  [NSMigratePersistentStoresAutomaticallyOption : true,
                        NSInferMappingModelAutomaticallyOption : true]
        
        
        let persistentStore = try? (self.persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options))!
        
        
        if(persistentStore != nil){
            
            self.moc = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
            self.moc?.persistentStoreCoordinator = self.persistentStoreCoordinator;
            
        }
        else{
            print("Coulf not create persistant store")
        }
        
        
    }
    
    func deleteEntityFromDBEntityName(entityName : String){
        
        let request = NSFetchRequest(entityName: entityName)
        
        self.moc?.performBlockAndWait({
            
            let objects = try? (self.moc?.executeFetchRequest(request))! as! [NSManagedObject]
            
            for obj in objects!{
                self.moc?.deleteObject(obj)
            }
            
            
        });
        
        
        
    }
    
    func saveMOCToStorage(){
        
        let success = false;
        
        var context = moc;
        
        while(context != nil && success == false){
            context?.performBlockAndWait({
                
                try! context?.save()
                
            });
            context = context?.parentContext
            
        }
        
    }


}
