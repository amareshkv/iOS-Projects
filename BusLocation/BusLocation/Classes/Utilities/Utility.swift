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
    
    
    class func showCRToastWithMessage(msg : String?, img : UIImage?){
        
        let font = UIFont(name: "Avenir-Light", size: 13)
        
        var options : [NSObject : AnyObject]? = [kCRToastNotificationTypeKey : CRToastType.Custom.rawValue,
                                           kCRToastNotificationPreferredHeightKey : 60,
                                           kCRToastFontKey : (font?.fontForDevice())!,
                                           kCRToastTextKey : msg!,
                                           kCRToastTextAlignmentKey:NSTextAlignment.Left.rawValue,
                                           kCRToastNotificationPresentationTypeKey:CRToastPresentationType.Cover.rawValue,
                                           kCRToastBackgroundColorKey : UIColor(white : 0, alpha : 0.7),
                                           kCRToastAnimationInTypeKey : CRToastAnimationType.Gravity.rawValue,
                                           kCRToastAnimationOutTypeKey : CRToastAnimationType.Linear.rawValue,
                                           kCRToastAnimationInDirectionKey : CRToastAnimationDirection.Top.rawValue,
                                           kCRToastAnimationOutDirectionKey : CRToastAnimationDirection.Top.rawValue,
                                           kCRToastTimeIntervalKey : 4]
        
    
        
        options![kCRToastImageKey]? = img!
   
    
        options![kCRToastInteractionRespondersKey] = [CRToastInteractionResponder(interactionType: CRToastInteractionType.Tap, automaticallyDismiss: true, block: { (interactionType) in
            
        })]
    
        CRToastManager.showNotificationWithOptions(options, apperanceBlock: {
            
            print("Appeared")
            }) { 
                print("Completed")
        }
    
        
    
    }


}
