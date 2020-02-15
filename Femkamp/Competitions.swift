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

    init(ComepetitionsOption: String, ComepetitionsInfo : String) {
            self.comepetitionsOption=ComepetitionsOption
            self.comepetitionsInfo=ComepetitionsInfo
    
       }

     init(coder decoder: NSCoder)
       {
        self.comepetitionsOption = decoder.decodeObject(forKey: "option") as! String
        self.comepetitionsInfo = decoder.decodeObject(forKey: "information") as! String
           
       }

       func encode(with coder: NSCoder)
       {
           coder.encode(comepetitionsOption, forKey: "option")
           coder.encode(comepetitionsInfo, forKey: "information")
          
       }
    

}


