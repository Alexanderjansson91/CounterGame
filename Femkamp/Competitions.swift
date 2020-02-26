//
//  Competitions.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-20.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import Foundation

struct Comepetitions : Codable{
    
    var comepetitionsOption : String
    var comepetitionsInfo : String

    //Constructur for "Comepetitions"
    init(ComepetitionsOption: String, ComepetitionsInfo : String) {
            self.comepetitionsOption=ComepetitionsOption
            self.comepetitionsInfo=ComepetitionsInfo
    
       }

}


