//
//  UserBaseViewController.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/5/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height


class UserBaseViewController: BaseViewController {
    
    let topBarColorHexValue : NSString = "#2FA3A2"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func keyboardWillHide(){
        
    }
    
    override func keyboardWillShow(){
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    // MARK: TOP Bar
    
    func addTopBar(title : String!, email : String!){
        
        let array = NSBundle.mainBundle().loadNibNamed("UserTopBarView", owner: self, options: nil) as NSArray
        let topView = array.firstObject as? UserTopBarView
        topView?.frame = CGRectMake(0,0,SCREEN_WIDTH,50)
        topView?.delegate = self
        topView?.showTopBar(title!, email: email!)
        self.view.addSubview(topView!)
        
    }
    
    func backButtonPressed(button:UIButton){
        
        self.navigationController?.popViewControllerAnimated(true)
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
