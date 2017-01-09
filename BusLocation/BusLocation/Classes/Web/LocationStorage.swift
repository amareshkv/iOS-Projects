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
    
    
    static let sharedStorage = LocationStorage()

    
    
    
    func applicationDocumentsDirectory() -> URL?{
        
        return FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).last
    }
    
    func startCoreData(){
        
        let path = Bundle.main.path(forResource: "DataModel", ofType: "momd");
        let momURL = URL(fileURLWithPath: path!);
        
        self.managedObjectModel = NSManagedObjectModel(contentsOf: momURL);
        
        self.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel!);
        
        let storeURL = self.applicationDocumentsDirectory()?.appendingPathComponent("database.sqlite");
        
        // handle db upgrade
        
        let options =  [NSMigratePersistentStoresAutomaticallyOption : true,
                        NSInferMappingModelAutomaticallyOption : true]
        
        
        let persistentStore = try? (self.persistentStoreCoordinator?.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options))!
        
        
        if(persistentStore != nil){
            
            self.moc = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
            self.moc?.persistentStoreCoordinator = self.persistentStoreCoordinator;
            
        }
        else{
            print("Coulf not create persistant store")
        }
        
        
    }
    
    func deleteEntityFromDBEntityName(_ entityName : String){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        self.moc?.performAndWait({
            
            let objects = try? (self.moc?.fetch(request))! as! [NSManagedObject]
            
            for obj in objects!{
                self.moc?.delete(obj)
            }
            
            
        });
        
        
        
    }
    
    func saveMOCToStorage(){
        
        let success = false;
        
        var context = moc;
        
        while(context != nil && success == false){
            context?.performAndWait({
                
                try! context?.save()
                
            });
            context = context?.parent
            
        }
        
    }


}
