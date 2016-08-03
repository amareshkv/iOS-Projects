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
    
    class func nearByWithAttributes(title : String?, key : String?, type : GoogleQuery_Type?) -> NearBy {
        
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
        
        
        let atm = NearBy(title: "ATMs", key: "atm|ATM",type: GoogleQuery_Type.ATM)
        let bus_station = NearBy(title: "Bus Stops", key: "bus_station", type : GoogleQuery_Type.Bus_Station)

        nearByArray?.append(atm)
        nearByArray?.append(bus_station)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: tableview delegates ------
    
    internal func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    internal func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 44
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (nearByArray?.count)!;
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell : NearByTableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? NearByTableViewCell
        
        let object = self.nearByArray![indexPath.row]
        
        cell?.titleLabel?.text = object.title
        
        
        return cell!
    }
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let object = self.nearByArray![indexPath.row]
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController") as? MapViewController
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
