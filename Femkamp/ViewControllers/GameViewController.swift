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
    var scoreLabel2 = GameRoundTableViewCell()
    //var person = Player(name: nil, score: 0)
    var questions : [Comepetitions]?
    @IBOutlet weak var TextFieldCompInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(player!)
        if let data = UserDefaults.standard.value(forKey:"players") as? Data {
            _ = try? PropertyListDecoder().decode(Array<Player>.self, from: data)
        }
        
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
    //     results = [person.score]
    //    }
    //
    //    func countResultArray(){
    //     person.score = results.reduce(0,+)
    //    }
    //
    //   func connectNameWhitLabel(){
    //     scoreLabel2.scoreLabel?.text = "\(String(describing: person.score))"
    //    }
    
    @IBAction func previewCompeition(_ sender: UIButton) {
        
        guard let quest = questions else {return}
        
        if currentCompetitionsIndex - 1 < quest.count  {
            currentCompetitionsIndex -= 1
            TextFieldCompInfo.text = quest[currentCompetitionsIndex].ComepetitionsInfo
        } else {
            currentCompetitionsIndex = 0
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
    }
    
    @IBAction func newCompetition(_ sender: UIButton)  {
        
        // results.append(String(describing: person.score))"
        
        print(results)
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
        print(results)
        
        let vc = segue.destination as! FinalResultViewController
        vc.finalResualt = self.player
        
        // vc.finalResualt1 = self.person.score
        
    }
}


