//
//  MenuViewController.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit

class NearBy : NSObject{
    
    var title : String?
    var key : String?
    var type : GoogleQuery_Type?
    
    class func nearByWithAttributes(_ title : String?, key : String?, type : GoogleQuery_Type?) -> NearBy {
        
        let object = NearBy(title: title, key: key, type: type)
        return object
        
    }
    
    init(title : String?, key : String?, type : GoogleQuery_Type?){
        
        super.init()
        self.title = title
        self.key = key
        self.type = type
    }
    
}

class MenuViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView?
    
    var nearByArray : [NearBy]? = [NearBy]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nearByPlaces()
        
        Utility.showCRToastWithMessage("Success", img: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nearByPlaces(){
        
        let atm = NearBy(title: "ATMs", key: "atm|ATM",type: GoogleQuery_Type.atm)
        nearByArray?.append(atm)
        
        let bus_station = NearBy(title: "Bus Stops", key: "bus_station", type : GoogleQuery_Type.bus_Station)
        nearByArray?.append(bus_station)
        
        let pharmacy = NearBy(title: "Pharmacy", key: "pharmacy", type : GoogleQuery_Type.bus_Station)
        nearByArray?.append(pharmacy)
        
        let restaurant = NearBy(title: "Restaurants", key: "restaurant", type: GoogleQuery_Type.restaurant)
        nearByArray?.append(restaurant)
        
        let travelagency = NearBy(title: "Travel agency", key: "travel_Agency", type: GoogleQuery_Type.travel_Agency)
        nearByArray?.append(travelagency)
        
        let cafe = NearBy(title: "Cafe", key: "cafe", type: GoogleQuery_Type.cafe)
        nearByArray?.append(cafe)
        
        let bank = NearBy(title: "Banks", key: "bank", type: GoogleQuery_Type.bank)
        nearByArray?.append(bank)
        
        let bar = NearBy(title: "Bar", key: "bar", type: GoogleQuery_Type.bar)
        nearByArray?.append(bar)
        
        let laundry = NearBy(title: "Laundry", key: "laundry", type: GoogleQuery_Type.laundry)
        nearByArray?.append(laundry)
        
        let spa = NearBy(title: "Spa", key: "spa", type: GoogleQuery_Type.spa)
        nearByArray?.append(spa)
        
        let police = NearBy(title: "Police", key: "police", type: GoogleQuery_Type.police)
        nearByArray?.append(police)
        
        let doctor = NearBy(title: "Doctors", key: "doctor", type: GoogleQuery_Type.doctor)
        nearByArray?.append(doctor)
        
        let subwayStation = NearBy(title: "Subway Station", key: "subwayStation", type: GoogleQuery_Type.subway_station)
        nearByArray?.append(subwayStation)
        
        let park = NearBy(title: "Parks", key: "park", type: GoogleQuery_Type.park)
        nearByArray?.append(park)
        
        
        
        
        
        tableView?.reloadData()

    }
    
    
    //MARK: tableview delegates ------
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 44
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (nearByArray?.count)!;
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell : NearByTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell") as? NearByTableViewCell
        
        let object = self.nearByArray![indexPath.row]
        
        cell?.titleLabel?.text = object.title
        
        
        return cell!
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let object = self.nearByArray![indexPath.row]
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        controller?.nearByObject = object
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
