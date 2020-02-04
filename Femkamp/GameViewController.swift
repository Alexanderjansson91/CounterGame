//
//  GameViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-30.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    @IBOutlet weak var nextCompetition: UIButton!
    var GameRoundTableViewcell = "GameRoundTableViewcell"
    @IBOutlet weak var tabelViewGameRound: UITableView!
    var results = [Int]()
    let GameCellId = "GameCellId"
    var player : [Player]?
    var questions : [Comepetitions]?
    var newVariableName = GameRoundTableViewCell()
    
   // private var ScoreValues = (1...100).map{$0}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextCompetition.layer.cornerRadius = 14
        nextCompetition.clipsToBounds = true
        
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameCellId, for: indexPath as IndexPath) as! GameRoundTableViewCell
        cell.textLabel?.text = player?[indexPath.row].name
        if let score = player?[indexPath.row].score {
            cell.scoreLabel?.text = String(score)
        }
        cell.player = player?[indexPath.row]
        print(player)
        return cell
        
    }
}

