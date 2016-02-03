//
//  LoginViewController.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 1/25/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

let kHomeController_ID = "HomeViewController"

class LoginViewController: BaseViewController,UITextFieldDelegate {
    
    @IBOutlet var mEmailTextField : UITextField?
    @IBOutlet var mPasswordTextField : UITextField?
    
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
    
    func goToHomeScreen(){
        
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier(kHomeController_ID)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    // MARK: Button actions
    
    @IBAction func loginButtonPressed(){
    
        UserServices.sharedInstance.loginUserWithCredentials("", password: "") { (data, error) -> Void in
            let str = NSString(data: data! as! NSData, encoding: 0)
            print("data = \(str!)")
            self.goToHomeScreen()
        }
    }
    
    
    // MARK: Override super class methods
    
    override func keyboardWillHide(){
        [UIView .animateWithDuration(0.4, animations: { () -> Void in
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            }, completion: { (value) -> Void in
                
        })]
        
        mEmailTextField?.resignFirstResponder()
        mPasswordTextField?.resignFirstResponder()
    }
    
    override func keyboardWillShow(){
        
        [UIView .animateWithDuration(0.4, animations: { () -> Void in
            self.view.frame = CGRectMake(self.view.frame.origin.x, -50, self.view.frame.size.width, self.view.frame.size.height);
            }, completion: { (value) -> Void in
                
        })]
        
        
        
    }
    
    


}
