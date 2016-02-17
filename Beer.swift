//
//  Beer.swift
//  Api
//
//  Created by John Ko on 2/16/16.
//  Copyright (c) 2016 John Ko. All rights reserved.
//

import Foundation

class Beer {
    var id : Int!
    var name : String!
    var beer_score : Float!
    var description : String!
    
    init(data : NSDictionary) {
        self.id = data["id"] as! Int
        self.beer_score = data["beer_score"] as! Float
        
        self.name = getStringFromJSON(data, key: "name")
        self.description = getStringFromJSON(data, key: "description")
        
    }
    
    func getStringFromJSON(data: NSDictionary, key: String) -> String {
        let info : AnyObject? = data[key]
        
        if let info = data[key] as? String {
            return info
        }
        
        return ""
    }
}