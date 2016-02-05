//
//  UserTopBarView.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/5/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

class UserTopBarView: UIView {

    @IBOutlet weak var emailLabel : UILabel?
    @IBOutlet weak var backButtonTitle : UIButton?
    weak var delegate : AnyObject?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setUpDefaultLayout()
    }
    
    
    
    func setUpDefaultLayout(){
        
        emailLabel?.fontForDevice()
        backButtonTitle?.fontForDevice()
        
    }
    
    
    func showTopBar(title: String, email: String){
        
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: email)
        attributeString.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSMakeRange(0, attributeString.length))
        emailLabel?.attributedText = attributeString
        
        
        backButtonTitle?.setTitle(title, forState: UIControlState.Normal)
        
        backButtonTitle?.addTarget(self, action: "backButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    func backButtonPressed(button:UIButton){
        
        if self.delegate!.respondsToSelector("backButtonPressed:"){
            let controller = self.delegate as? UserBaseViewController
            controller?.backButtonPressed(button)
            
        }
    }
    
    
}
