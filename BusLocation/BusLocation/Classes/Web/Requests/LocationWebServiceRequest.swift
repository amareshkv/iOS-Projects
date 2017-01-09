//
//  LocationWebService.swift
//  BusLocation
//
//  Created by Amaresh K V on 31/07/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class LocationWebServiceRequest: NSObject {
    
    var _headers : NSMutableDictionary?
    var _body : NSMutableDictionary?
    var _url : URL?
    //    weak var _manager : PTWebService?
    var _receivedData : NSMutableData?
    var _session : URLSession?
    var _block : webServiceCompletionBlock?
    
    
    init(block : @escaping webServiceCompletionBlock) {
        
        super.init()
        
        self._block = block
        self._headers = NSMutableDictionary(capacity: 0)
        self._body = NSMutableDictionary(capacity: 0)
        
        //self._url = NSURL(string: "https://api.github.com/users/mralexgray/repos")
        self._receivedData = NSMutableData(capacity: 0)
        
        self._session = URLSession.shared
        
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
        
        let request : NSMutableURLRequest? = NSMutableURLRequest(url: _url!)
        
        if _body?.allKeys.count>0{
            request!.httpBody = try! JSONSerialization.data(withJSONObject: _body!, options: .prettyPrinted)
        }
        for key in (_headers?.allKeys as! [String]?)!{
            
            request?.addValue(_headers?.value(forKey: key) as! String, forHTTPHeaderField: key)
        }

        let sessionTask = self._session?.dataTask(with: _url!, completionHandler: { (data, response, error) in
            
            if error != nil{
                self.requestFailed(error)
                return
            }
            
            self.requestComplete(data)
            
            
        })
        sessionTask?.resume()
        
    }
    
    
    func requestComplete(_ data : Data?) {
        
        
    }
    
    
    func requestFailed(_ error : Error?){
        
        
    }


}
