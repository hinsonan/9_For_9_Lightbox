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
    var creater: String?
    
    init(name: String, location: String, date: String, password: String, creater: String){
        self.name = name
        self.location = location
        self.password = password
        self.creater = creater
        self.date = date
        
    }
    
    convenience init(name: String, location: String, date: String, password: String, creater: String, imgName: String){
        self.init(name: name, location: location, date: date, password: password, creater: creater)
        self.imgName = imgName
    }
    
    convenience init(name: String, location: String, date: String, password: String, creater: String, imgURL: String){
        self.init(name: name, location: location, date: date, password: password, creater: creater)
        self.imgURL = imgURL
    }
}
