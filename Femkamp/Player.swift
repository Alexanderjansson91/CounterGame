//
//  Player.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-16.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import Foundation

class Player : NSObject, Decodable, Encodable, NSCoding, Comparable{
  
    
    //CustomStringConvertible
   // NSObject, NSCoding
    
    
    var name : String?
    var score : Int
    //var scoreForEachRound = [Int]()
    
  // public var description: String { return "\(String(describing: name)) : \(score)" }
//
    //scoreForEachRound: [Int]
    init(name: String?, score: Int ) {
        self.name=name
        self.score=score
        //self.scoreForEachRound=scoreForEachRound
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score > rhs.score
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.score == rhs.score
    }
   
    

func encode(with aCoder: NSCoder)
   {
       aCoder.encode(self.name, forKey: "name")
       aCoder.encode(self.score, forKey: "score")
   }

   required init?(coder aDecoder: NSCoder)
   {

    self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
    self.score = aDecoder.decodeInteger(forKey: "score")
   }
}
    
    


