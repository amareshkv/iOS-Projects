//
//  NSDictionary+Additions.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 01/08/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    func arrayForKey(key : String) -> NSArray?{
        
        let obj = self.valueForKey(key)
        
        let string = obj as? NSArray
        
        return string
        
    }
    
    func dictionaryForKey(key : String) -> NSDictionary?{
        
        let obj = self.valueForKey(key)
        
        let string = obj as? NSDictionary
        
        return string
        
    }
    
    func stringForKey(key : String) -> String?{
        
        let obj = self.valueForKey(key)
        
        let string = obj as? String
        
        return string
    }
    
    func numberForKey(key : String) -> NSNumber?{
        
        let obj = self.valueForKey(key)
        
        let string = obj as? NSNumber
        
        return string
    }
    
    
}
