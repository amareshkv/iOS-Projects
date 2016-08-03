//
//  MapViewController.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit
import MapKit


let kUserLocationNotification = "userlocation_notification"

class MapViewController: BaseViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView : MKMapView?
    
    var objectArray : [QueryObject]? = [QueryObject]()
    
    var nearByObject : NearBy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView?.showsUserLocation = true

        showUserLocation()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MapViewController.updateUserLocation(_:)), name: kUserLocationNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUserLocation(notif : NSNotification){
        
        let location : CLLocation? = notif.object as? CLLocation
        
        plotUserLocation(location)
        
        self.plotOtherLocations()
    }
    
    func showUserLocation(){
        
        if(LocationServices.sharedServices.userLocation != nil){
            
            plotUserLocation(LocationServices.sharedServices.userLocation)
            
            let region = MKCoordinateRegionMakeWithDistance(LocationServices.sharedServices.userLocation!.coordinate, 1000*1.6, 1000*1.6)
            mapView!.setRegion(region, animated: true)
        }
        
        
        LocationServices.sharedServices.queryForType((self.nearByObject?.type)!) { (data, error) in
    
            let array = data as? [QueryObject]
            self.objectArray = array
            self.plotOtherLocations()
            
        }
        
    }
    
    func plotUserLocation(location : CLLocation?){
        
        mapView?.removeAnnotations(mapView!.annotations)
        
        
    
    }
    
    
    func plotOtherLocations(){
        
        for queryObject in self.objectArray! {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(queryObject.latitude!), CLLocationDegrees(queryObject.longitude!))
            annotation.title = queryObject.name
            mapView?.addAnnotation(annotation)
        }
        
    }
    
    
    func CLLocationCoordinateEqual(coordinate1 : CLLocationCoordinate2D, coordinate2 : CLLocationCoordinate2D) -> Bool{
        return (fabs(coordinate1.latitude - coordinate2.latitude) <= DBL_EPSILON && fabs(coordinate1.longitude - coordinate2.longitude) <= DBL_EPSILON)
    }
    
    
    //MARK: Mapview delegates -----
    
    internal func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation){
        
        
        
    }
    
    internal func viewForAnnotation(annotation: MKAnnotation) -> MKAnnotationView?{
        
        if (CLLocationCoordinateEqual(annotation.coordinate, coordinate2: (mapView?.userLocation.coordinate)!) == true){
            return nil
        }
        
        let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        view.canShowCallout = true
        view.animatesDrop = true
        return view
    }
    
    
    deinit{
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
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
