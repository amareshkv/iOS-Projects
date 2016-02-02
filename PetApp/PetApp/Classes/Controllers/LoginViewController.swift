//
//  LoginViewController.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 1/25/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        print(" controller deinit called")
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        return true;
        
    }
    
    @IBAction func loginButtonPressed(){
    
        UserServices.sharedInstance.loginUserWithCredentials("", password: "") { (data, error) -> Void in
            let str = NSString(data: data! as! NSData, encoding: 0)
            print("data = \(str!)")
        }
    }
    
    

}
