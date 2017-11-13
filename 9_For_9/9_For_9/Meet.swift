//
//  Meet.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/4/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import Foundation

class Meet{
    var name: String?
    var location: String?
    var date: String?
    var imgName: String?
    var imgURL: String?
    var password: String?
    var creator: String?
    
    init(name: String, location: String, date: String, password: String, creator: String){
        self.name = name
        self.location = location
        self.password = password
        self.creator = creator
        self.date = date
        
    }
    
    convenience init(name: String, location: String, date: String, password: String, creator: String, imgName: String){
        self.init(name: name, location: location, date: date, password: password, creator: creator)
        self.imgName = imgName
    }
    
    convenience init(name: String, location: String, date: String, password: String, creator: String, imgURL: String){
        self.init(name: name, location: location, date: date, password: password, creator: creator)
        self.imgURL = imgURL
    }
}
