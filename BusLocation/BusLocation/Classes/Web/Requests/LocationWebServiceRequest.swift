//
//  LocationWebService.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit

class LocationWebServiceRequest: NSObject {
    
    var _headers : NSMutableDictionary?
    var _body : NSMutableDictionary?
    var _url : NSURL?
    //    weak var _manager : PTWebService?
    var _receivedData : NSMutableData?
    var _session : NSURLSession?
    var _block : webServiceCompletionBlock?
    
    
    init(block : webServiceCompletionBlock) {
        
        super.init()
        
        self._block = block
        self._headers = NSMutableDictionary(capacity: 0)
        self._body = NSMutableDictionary(capacity: 0)
        
        //self._url = NSURL(string: "https://api.github.com/users/mralexgray/repos")
        self._receivedData = NSMutableData(capacity: 0)
        
        self._session = NSURLSession.sharedSession()
        
    }
    
    
    deinit{
        print("webservice deinit called")
        self._headers = nil
        self._body = nil
        self._url = nil
        self._receivedData = nil
        self._session = nil
    }
    
    func start(){
        
        setUpRequestAndStart()
        
    }
    
    
    func setUpRequestAndStart(){
        
        let request : NSMutableURLRequest? = NSMutableURLRequest(URL: _url!)
        
        if _body?.allKeys.count>0{
            request!.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(_body!, options: .PrettyPrinted)
        }
        for key in (_headers?.allKeys as! [String]?)!{
            
            request?.addValue(_headers?.valueForKey(key) as! String, forHTTPHeaderField: key)
        }
        
        let sessionTask = self._session?.dataTaskWithRequest(request!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil{
                self.requestFailed(error!)
                return
            }
            
            self.requestComplete(data)
            
            
        })
        sessionTask?.resume()
        
    }
    
    
    func requestComplete(data : NSData?) {
        
        
    }
    
    
    func requestFailed(error : NSError){
        
        
    }


}
