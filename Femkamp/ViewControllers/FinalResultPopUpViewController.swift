//
//  FinalResultPopUpViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-21.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class FinalResultPopUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var finalScoreEachRound : [Player]?
    @IBOutlet weak var scoreForEachRoundTeams: UILabel!
     var competitions : [Comepetitions]?
    let scoreForEachRoundCell = "scoreForEachRoundCell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Player.self)
        
       
//        if let playerName = finalScoreEachRound{
//            scoreForEachRoundTeams.text = "\(String(describing: playerName))"
//               }
        //scoreForEachRoundTeams.text = finalScoreEachRound?.name
        
    

       scoreForEachRoundTeams.text =  "\(String(describing: finalScoreEachRound))"
        //scoreForEachRoundTeams = [Player.init(name: nil, score: 0)]?
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return competitions!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreForEachRoundCell" , for: indexPath) as! ScoreForEachRoundTableViewCell
        //  Player.player.name? = highScore?[indexPath.row].score
       
        cell.textLabel?.text = competitions?[indexPath.row].comepetitionsOption
    
     
        if let score = finalScoreEachRound?[indexPath.row].scoreForEachRound {
                   cell.scoreforEachRoundLabel.text = String("\(score)")
               }
     
        return cell
    }

    @IBAction func closeScoreForEachRound(_ sender: UIButton) {
        
              dismiss(animated: true, completion: nil)
    }
    

}
