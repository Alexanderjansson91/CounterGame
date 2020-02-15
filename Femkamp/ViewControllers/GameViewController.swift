//
//  GameViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-30.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var previewButton: UIButton!
    var currentCompetitionsIndex = 0
    @IBOutlet weak var nextCompetition: UIButton!
    var gameRoundTableViewcell = "GameRoundTableViewcell"
    @IBOutlet weak var tabelViewGameRound: UITableView!
    var results = [Int]()
    let gameCellId = "GameCellId"
    var players : [Player]? = []
    var scoreLabel2 = GameRoundTableViewCell()
    var stepper2 = GameRoundTableViewCell()
    
    var questions : [Comepetitions]?
    @IBOutlet weak var textFieldCompInfo: UITextView!
    @IBOutlet weak var headingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextCompetition.layer.cornerRadius = 26
        nextCompetition.clipsToBounds = true
        
        if let competition = questions?[currentCompetitionsIndex] {
            textFieldCompInfo?.text = competition.comepetitionsInfo
            headingLabel.text = competition.comepetitionsOption
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: gameCellId, for: indexPath as IndexPath) as! GameRoundTableViewCell
        
        cell.textLabel?.text = players?[indexPath.row].name
        if let score = players?[indexPath.row].score {
            cell.scoreLabel?.text = String(score)
            // cell.scoreLabel?.text =  "\(String(describing: person.score))"
        }
        cell.player = players?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func refresh(){
        tabelViewGameRound.reloadData()
    }
    
    //        func connectResultArrayWhitPlayer(){
    //         results = [person.score]
    //        }
    //        func countResultArray(){
    //
    //
    //        }
    //       func connectNameWhitLabel(){
    //        scoreLabel2.scoreLabel?.text = "\(String(describing: Player?.self))"
    //        //scoreLabel2.scoreLabel?.text = "\(String(describing: player.score))"
    //        }
    
    @IBAction func previewCompeition(_ sender: UIButton)  {
        
        
        guard let quest = questions else {return}
        
        if currentCompetitionsIndex - 1 < quest.count  {
            currentCompetitionsIndex -= 1
            textFieldCompInfo.text = quest[currentCompetitionsIndex].comepetitionsInfo
            headingLabel.text = quest[currentCompetitionsIndex].comepetitionsOption
            
        } else {
            currentCompetitionsIndex = 0
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        if currentCompetitionsIndex == 0{
            previewButton.isHidden = true
        }
    }
    
    @IBAction func newCompetition(_ sender: UIButton)  {
        guard let players = players else {return}
        
        for player in players {
            player.scoreForEachRound.append(player.score)
            player.score = 0
            
        }
    
        //stepper2.stepper.value = 0.0;
        tabelViewGameRound.reloadData()
        print(results)
        
        guard let quest = questions else {return}
        
        if currentCompetitionsIndex + 1 < quest.count  {
            currentCompetitionsIndex += 1
            textFieldCompInfo.text = quest[currentCompetitionsIndex].comepetitionsInfo
            headingLabel.text = quest[currentCompetitionsIndex].comepetitionsOption
        } else {
            currentCompetitionsIndex = 0
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        if currentCompetitionsIndex > 0{
            previewButton.isHidden = false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(results)
        
        let vc = segue.destination as! FinalResultViewController
        vc.finalResualt = self.players
        //countResultArray()
        // vc.finalResualt1 = self.person.score
        
    }
}


