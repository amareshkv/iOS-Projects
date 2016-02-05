//
//  UIKit+Additions.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/5/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import Foundation
import UIKit


let STANDARD_SCREEN_WIDTH : CGFloat = 320
let STANDARD_SCREEN_HEIGHT : CGFloat = 568

let UI_SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let UI_SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height



extension UIFont{
    
    public func fontForDevice()->UIFont{
        
        let fontSize = UI_SCREEN_HEIGHT * self.pointSize/STANDARD_SCREEN_HEIGHT
        return UIFont(name: self.fontName, size: fontSize)!
        
    }
    
    
    public func fontForS_Device()->UIFont{
        
        let fontSize = SCREEN_WIDTH * self.pointSize/STANDARD_SCREEN_WIDTH
        return UIFont(name: self.fontName, size: fontSize)!
        
    }
    
}



extension UILabel{
    
    public func fontForDevice(){
        
        let fontSize = UI_SCREEN_HEIGHT * self.font.pointSize/STANDARD_SCREEN_HEIGHT
        self.font = UIFont(name: self.font.fontName, size: fontSize)!
        
    }
    
    
    public func fontForS_Device()->UIFont{
        
        let fontSize = SCREEN_WIDTH * self.font.pointSize/STANDARD_SCREEN_WIDTH
        return UIFont(name: self.font.fontName, size: fontSize)!
        
    }
    
}



extension UIButton{
    
    public func fontForDevice(){
        
        let fontSize = UI_SCREEN_HEIGHT * self.titleLabel!.font.pointSize/STANDARD_SCREEN_HEIGHT
        self.titleLabel!.font = UIFont(name: self.titleLabel!.font.fontName, size: fontSize)!
        
    }
    
    
    public func fontForS_Device()->UIFont{
        
        let fontSize = SCREEN_WIDTH * self.titleLabel!.font.pointSize/STANDARD_SCREEN_WIDTH
        return UIFont(name: self.titleLabel!.font.fontName, size: fontSize)!
        
    }
    
}
