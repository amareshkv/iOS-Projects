//
//  UIColor+Additions.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/5/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    public class func colorForHex(hexColor : NSString) -> UIColor{
        
        return UIColor.colorForHexWithOpacity(hexColor, opacity: 1)
        
    }
    
    
    public class func colorForHexWithOpacity(hex : NSString, opacity: Float) -> UIColor{
        
        var hexColor = hex
        hexColor = hexColor.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        // String should be 6 or 7 characters if it includes '#'
        if hexColor.length<6{
            return UIColor.blackColor()
        }
        
        // strip # if it appears
        if hexColor.hasPrefix("#"){
            hexColor = hexColor.substringFromIndex(1)
        }
        
        // if the value isn't 6 characters at this point return
        // the color black
        
        if (hexColor.length != 6){
            return UIColor.blackColor()
        }
        
        // Separate into r, g, b substrings
        
        var range : NSRange = NSRange(location: 0, length: 2)
        
        let rString = hexColor.substringWithRange(range)
        
        range.location = 2;
        
        let gString = hexColor.substringWithRange(range)
        
        range.location = 4;
        
        let bString = hexColor.substringWithRange(range)
        
        // Scan values
        
        var r : CUnsignedInt = 0
        var g : CUnsignedInt = 0
        var b : CUnsignedInt = 0
        
        
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(Float(r) / Float(255.0)), green: CGFloat(Float(g) / Float(255.0)), blue: CGFloat(Float(b) / Float(255.0)), alpha: CGFloat(opacity))
        
        
    }

}
