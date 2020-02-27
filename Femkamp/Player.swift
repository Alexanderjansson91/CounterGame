//
//  Player.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-16.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import Foundation

class Player : CustomStringConvertible, Comparable{
   
    var name : String?
    var score : Int
    var scoreForEachRound: [Int] = []
    
    public var description: String { return "\(String(describing: name)) : \(score)" }
    
    //Constructor for my Player class
    init(name: String?, score: Int) {
        self.name=name
        self.score=score

    }
    //makes Player class sortable
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score > rhs.score
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.score == rhs.score
    }
    
    //score array for game each round
    func totalScore() -> Int {
        var totalScore = 0
        for score in scoreForEachRound{
            totalScore += score
         
        }
        
        return totalScore
    }
}
    
    


