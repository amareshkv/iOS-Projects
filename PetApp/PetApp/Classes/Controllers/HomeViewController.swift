//
//  HomeViewController.swift
//  PetApp
//
//  Created by Amaresh Kundeppady Venkappa on 2/2/16.
//  Copyright © 2016 Amaresh Kundeppady Venkappa. All rights reserved.
//

import UIKit
import MapKit

let kPetsControllerID = "PetsViewController"

class HomeViewController: BaseViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var mMapView : MKMapView?
    var locationManager : CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager!.delegate = self;
        
        if ((self.locationManager?.respondsToSelector(Selector("requestWhenInUseAuthorization"))) != nil){
            self.locationManager?.requestWhenInUseAuthorization()
        }
        self.locationManager?.startUpdatingLocation()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goToPetsScreen(petsArray:NSArray){
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(kPetsControllerID) as? PetsViewController
        controller!.mPetsArray = petsArray
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    
    // MARK: Button actions
    
    @IBAction func viewPetProfilesButtonPressed(){
        
        PetServices.sharedInstance.getPetsInfo("") { (data, error) -> Void in
            /*let array : NSArray = data as! NSArray
            print("array = \(array)")
            if array.count>0{
                self.goToPetsScreen(array)
            }*/
        }
        
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
