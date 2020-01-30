//
//  Player.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-16.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import Foundation

class Player : CustomStringConvertible{
    var name : String?
    var score : Int
    
    
    public var description: String { return "\(name) : \(score)" }

    init(name: String?, score: Int) {
        self.name=name
        self.score=score
    }
    
    
}

