//
//  SplashViewController.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 1/25/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

let kLoginController_ID = "LoginViewController"

class SplashViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.performSelector(Selector("goToLoginScreen"), withObject: nil, afterDelay: 2)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goToLoginScreen(){
        
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier(kLoginController_ID)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
