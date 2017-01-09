//
//  Utility.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 03/08/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit
import CRToast

class Utility: NSObject {
    
    
    class func showCRToastWithMessage(_ msg : String?, img : UIImage?){
        
        let font = UIFont(name: "Avenir-Light", size: 13)
        
        var options : [AnyHashable: Any]? = [kCRToastNotificationTypeKey : NSNumber(value : CRToastType.custom.rawValue),
                                           kCRToastNotificationPreferredHeightKey : NSNumber(value: 64),
                                           kCRToastFontKey : (font?.fontForDevice())!,
                                           kCRToastTextKey : msg!,
                                           kCRToastTextAlignmentKey:NSNumber(value : NSTextAlignment.left.rawValue),
                                           kCRToastNotificationPresentationTypeKey:NSNumber(value : CRToastPresentationType.cover.rawValue),
                                           kCRToastBackgroundColorKey : UIColor(white : 0, alpha : 0.7),
                                           kCRToastAnimationInTypeKey : NSNumber(value : CRToastAnimationType.gravity.rawValue),
                                           kCRToastAnimationOutTypeKey : NSNumber(value : CRToastAnimationType.linear.rawValue),
                                           kCRToastAnimationInDirectionKey : NSNumber(value : CRToastAnimationDirection.top.rawValue),
                                           kCRToastAnimationOutDirectionKey : NSNumber(value : CRToastAnimationDirection.top.rawValue),
                                           kCRToastTimeIntervalKey : NSNumber(value : 4)]
        
    
        
        options![kCRToastImageKey]? = img!
   
    
        options![kCRToastInteractionRespondersKey] = [CRToastInteractionResponder(interactionType: CRToastInteractionType.tap, automaticallyDismiss: true, block: { (interactionType) in
            
        })]
    
        CRToastManager.showNotification(options: options, apperanceBlock: {
            
            print("Appeared")
            }) { 
                print("Completed")
        }
    
        
    
    }


}
