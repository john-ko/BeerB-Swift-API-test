//
//  DribbleAPI.swift
//  Api
//
//  Created by John Ko on 11/21/15.
//  Copyright (c) 2015 John Ko. All rights reserved.
//

import Foundation

class APIcall {
    let apiEndpoint = "";
    
    func loadObj(completion: ((AnyObject) -> Void)!) {
        var urlString = "http://beer.dev/api/v1/beers";
        
        let session = NSURLSession.sharedSession();
        let beerUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(beerUrl!) {
            (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
            } else {
                var error : NSError?
                
                var beerData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSArray
                
                var beers = [Beer]()
                
                for beer in beerData {
                    let beer = Beer(data: beer as! NSDictionary)
                    beers.append(beer)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(beers)
                    }
                }
            }
        }
        
        task.resume()
    }
}