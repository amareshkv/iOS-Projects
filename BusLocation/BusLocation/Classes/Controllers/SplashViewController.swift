//
//  SplashViewController.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = LocationServices.sharedServices

        self.perform(#selector(SplashViewController.gotoMenuScreen), with: nil, afterDelay: 2)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func gotoMenuScreen(){
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        self.navigationController?.pushViewController(controller!, animated: true)
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
