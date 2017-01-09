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
    
    public class func colorForHex(_ hexColor : NSString) -> UIColor{
        
        return UIColor.colorForHexWithOpacity(hexColor, opacity: 1)
        
    }
    
    
    public class func colorForHexWithOpacity(_ hex : NSString, opacity: Float) -> UIColor{
        
        var hexColor = hex
        hexColor = hexColor.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
        
        // String should be 6 or 7 characters if it includes '#'
        if hexColor.length<6{
            return UIColor.black
        }
        
        // strip # if it appears
        if hexColor.hasPrefix("#"){
            hexColor = hexColor.substring(from: 1) as NSString
        }
        
        // if the value isn't 6 characters at this point return
        // the color black
        
        if (hexColor.length != 6){
            return UIColor.black
        }
        
        // Separate into r, g, b substrings
        
        var range : NSRange = NSRange(location: 0, length: 2)
        
        let rString = hexColor.substring(with: range)
        
        range.location = 2;
        
        let gString = hexColor.substring(with: range)
        
        range.location = 4;
        
        let bString = hexColor.substring(with: range)
        
        // Scan values
        
        var r : CUnsignedInt = 0
        var g : CUnsignedInt = 0
        var b : CUnsignedInt = 0
        
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(Float(r) / Float(255.0)), green: CGFloat(Float(g) / Float(255.0)), blue: CGFloat(Float(b) / Float(255.0)), alpha: CGFloat(opacity))
        
        
    }

}
