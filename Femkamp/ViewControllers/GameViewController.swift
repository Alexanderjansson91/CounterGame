//
//  GameViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-30.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var highScoreButton: UIButton!
    @IBOutlet weak var previewButton: UIButton!
    var currentCompetitionsIndex = 0
    @IBOutlet weak var nextCompetition: UIButton!
    var gameRoundTableViewcell = "GameRoundTableViewcell"
    @IBOutlet weak var tabelViewGameRound: UITableView!
    let gameCellId = "GameCellId"
    var players : [Player]? = []
    var scoreLabel2 = GameRoundTableViewCell()
    var stepper2 = GameRoundTableViewCell()
    
    var competitions : [Comepetitions]?
    @IBOutlet weak var textFieldCompInfo: UITextView!
    @IBOutlet weak var headingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldCompInfo.layer.cornerRadius = 10
        textFieldCompInfo.clipsToBounds = true
        headingLabel.layer.cornerRadius = 10
        headingLabel.clipsToBounds = true
        
        //Displays the first competition when the page opens
        if let competition = competitions?[currentCompetitionsIndex] {
            textFieldCompInfo?.text = competition.comepetitionsInfo
            headingLabel.text = competition.comepetitionsOption
        }
    }
    //counts number of rows in array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players!.count
    }
    // Design and structure for tableviewcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: gameCellId, for: indexPath as IndexPath) as! GameRoundTableViewCell
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        cell.textLabel?.text = players?[indexPath.row].name
        if let score = players?[indexPath.row].score {
            cell.scoreLabel?.text = String(score)
        }
        cell.player = players?[indexPath.row]
    //Clear Stepper
        if let score = players?[indexPath.row].score {
            cell.scoreLabel.text = String(score)
            cell.stepper?.value = Double(score)
        }
     
        
        return cell
    }
    //Height of tableview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    //refresh tableview
    func refresh(){
        tabelViewGameRound.reloadData()
    }
    //Preview competition button, if you press this button you will also remove score from "scoreForEachRound"
    @IBAction func previewCompeition(_ sender: UIButton)  {
        
        guard let removeScore = players else {return}
               for player in removeScore {
                player.scoreForEachRound.remove(at: player.score)
                   player.score = 0
               }
        guard let quest = competitions else {return}
        
        if currentCompetitionsIndex - 1 < quest.count  {
            currentCompetitionsIndex -= 1
            textFieldCompInfo.text = quest[currentCompetitionsIndex].comepetitionsInfo
            headingLabel.text = quest[currentCompetitionsIndex].comepetitionsOption
        } else {
            currentCompetitionsIndex = 0
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        //Hide button if you are the first competition
        if currentCompetitionsIndex == 0{
            previewButton.isHidden = true
        }
    }
    //button for New competition, if you press this button you will also add score to "scoreForEachRound"
    @IBAction func newCompetition(_ sender: UIButton)  {
     
        guard let players = players else {return}
        for player in players {
            player.scoreForEachRound.append(player.score)
            player.score = 0
        }
        tabelViewGameRound.reloadData()
        guard let quest = competitions else {return}
        
        if currentCompetitionsIndex + 1 < quest.count  {
            currentCompetitionsIndex += 1
            textFieldCompInfo.text = quest[currentCompetitionsIndex].comepetitionsInfo
            headingLabel.text = quest[currentCompetitionsIndex].comepetitionsOption
             
        } else {
            currentCompetitionsIndex = 0
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        //show previewButton if you move on to the next competition
        if currentCompetitionsIndex > 0{
            previewButton.isHidden = false
        }
        
    }
    
    //All Information how wants to follow the Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)   {
        
        //Segue for finaslresult
        if segue.identifier == "resultSegue"{
            let vc = segue.destination as! FinalResultViewController
            vc.finalResualt = self.players
            vc.comepetition = self.competitions!
        
        }
        //Segue for highscore
        if segue.identifier == "highScoreSegue"{
            let vc2 = segue.destination as! PopUpViewController
            vc2.highScore = self.players
           
        }
    }
}


