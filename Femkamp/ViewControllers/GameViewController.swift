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
        
        if let score = players?[indexPath.row].score {
            cell.scoreLabel.text = String(score)
            cell.stepper?.value = Double(score)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func refresh(){
        tabelViewGameRound.reloadData()
    }
    
    //When I Press this button I want to reset the stepper.
    @IBAction func previewCompeition(_ sender: UIButton)  {
        
        guard let removeScore = players else {return}

               for player in removeScore {
                player.scoreForEachRound.remove(at: player.score)
                   player.score = 0
               }
        
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
       
        //print(stepper2.stepper?.value as Any//)
        
       stepper2.stepper?.value = 0
     
        guard let players = players else {return}
        
        for player in players {
            player.scoreForEachRound.append(player.score)
            player.score = 0
           
        }
        tabelViewGameRound.reloadData()
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
        
        if segue.identifier == "resultSegue"{
        let vc = segue.destination as! FinalResultViewController
        vc.finalResualt = self.players
        }
        if segue.identifier == "highScoreSegue"{
        let vc2 = segue.destination as! PopUpViewController
           vc2.highScore = self.players
        }
        
    }
}


