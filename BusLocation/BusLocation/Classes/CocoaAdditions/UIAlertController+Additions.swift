//
//  UIAlertController+Additions.swift
//  RemoteSwitch
//
//  Created by Amaresh Kundeppady Venkappa on 24/07/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import Foundation
import UIKit

typealias UIAlertOKAction = (()->Void)
typealias UIAlertCancelAction = (()->Void)

extension UIAlertController{
    
    class func showAlert(_ title : String?, message : String?, cancelButtonTitle : String?, onController : UIViewController){
        
        self.showAlert(title, message: message, cancelButtonTitle: cancelButtonTitle, okButtonTitle: nil, onController: onController, cancelBlock: nil, okBlock: nil)
        
    }
    
    
    class func showAlert(_ title : String?, message : String?, cancelButtonTitle : String?, okButtonTitle : String?, onController : UIViewController, cancelBlock : UIAlertCancelAction?, okBlock : UIAlertOKAction?){
        
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            if(cancelButtonTitle != nil){
                
                let cancelAction = UIAlertAction(title: cancelButtonTitle, style: UIAlertActionStyle.default, handler: { (action) in
                    cancelBlock!()
                })
                alert.addAction(cancelAction)
                
            }
            
            
            if(okButtonTitle != nil){
                
                let okAction = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.default, handler: { (action) in
                    okBlock!()
                })
                alert.addAction(okAction)
                
            }
            
            
            onController.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
}
