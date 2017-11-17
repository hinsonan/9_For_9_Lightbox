//
//  Judge.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/17/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import Foundation

class Judge{
    //Position enum that holds the three possible values
    enum Position{
        case Left
        case Head
        case Right
    }
    
    var position: Position?
    
    init(position: Position){
        self.position = position
    }
}
