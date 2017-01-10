//
//  SplashViewController.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    @IBOutlet weak var bgImageView : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = "LaunchImage-700@2x.png"
        let screenheight = UIScreen.main.bounds.size.height
        switch screenheight {
        case 736:
            image = "LaunchImage-800-Portrait-736h@3x.png"
            break
            
        case 667:
            image = "LaunchImage-800-667h@2x.png"
            break
            
        case 568:
            image = "LaunchImage-700-568h@2x.png"
            break
            
        default:
            image = "LaunchImage-700@2x.png"
        }
        
        bgImageView.image = UIImage(named: image)
        
        let _ = LocationServices.sharedServices
        AdServices.sharedServices.showSplashAd()

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
