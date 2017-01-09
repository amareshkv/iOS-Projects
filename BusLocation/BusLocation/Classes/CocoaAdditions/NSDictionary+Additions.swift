//
//  NSDictionary+Additions.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 01/08/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    func arrayForKey(_ key : String) -> NSArray?{
        
        let obj = self.value(forKey: key)
        
        let string = obj as? NSArray
        
        return string
        
    }
    
    func dictionaryForKey(_ key : String) -> NSDictionary?{
        
        let obj = self.value(forKey: key)
        
        let string = obj as? NSDictionary
        
        return string
        
    }
    
    func stringForKey(_ key : String) -> String?{
        
        let obj = self.value(forKey: key)
        
        let string = obj as? String
        
        return string
    }
    
    func numberForKey(_ key : String) -> NSNumber?{
        
        let obj = self.value(forKey: key)
        
        let string = obj as? NSNumber
        
        return string
    }
    
    
}
