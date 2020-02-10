//
//  GameViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-30.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var currentCompetitionsIndex = 0
    @IBOutlet weak var nextCompetition: UIButton!
    var GameRoundTableViewcell = "GameRoundTableViewcell"
    @IBOutlet weak var tabelViewGameRound: UITableView!
    var results : [Int] = []
    let GameCellId = "GameCellId"
    var player : [Player]? = []
    //var person = Player(name: nil, score: 0)
    var questions : [Comepetitions]?
    @IBOutlet weak var TextFieldCompInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextCompetition.layer.cornerRadius = 26
        nextCompetition.clipsToBounds = true
        
        if let competition = questions?[currentCompetitionsIndex] {
            TextFieldCompInfo?.text = competition.ComepetitionsInfo
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameCellId, for: indexPath as IndexPath) as! GameRoundTableViewCell
        
        cell.textLabel?.text = player?[indexPath.row].name
        if let score = player?[indexPath.row].score {
            cell.scoreLabel?.text = String(score)
           // cell.scoreLabel?.text =  "\(String(describing: person.score))"

        }
        cell.player = player?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
     func refresh(){
          tabelViewGameRound.reloadData()
      }
    
//    func connectResultArrayWhitPlayer(){
//
//        let score = 0
//        results = [score]
//
//    }

//    func countResultArray(){
//        player?.score = results.reduce(0,+)
//        person.score += 1
//        results = [ person.score]
//    }
    
//   func connectNameWhitLabel(){
//
//    }
    
    @IBAction func newCompetition(_ sender: UIButton)  {
        //connectResultArrayWhitPlayer()
        //countResultArray()
      //  print(person)
        print(results)
        print(player as Any)
        
        guard let quest = questions else {return}
        
        if currentCompetitionsIndex + 1 < quest.count  {
            currentCompetitionsIndex += 1
            TextFieldCompInfo.text = quest[currentCompetitionsIndex].ComepetitionsInfo
        } else {
            currentCompetitionsIndex = 0
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //countResultArray()
        let vc = segue.destination as! FinalResultViewController
        vc.finalResualt = self.player
      
    }
   
    
}


