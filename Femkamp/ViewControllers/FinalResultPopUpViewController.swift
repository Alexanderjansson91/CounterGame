//
//  FinalResultPopUpViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-21.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class FinalResultPopUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
 //   var finalScoreEachRound : [Player]?
    @IBOutlet weak var scoreForEachRoundTeams: UILabel!
     var competitions : [Comepetitions]?
    let scoreForEachRoundCell = "scoreForEachRoundCell"
    var player : Player?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Player.self)
    
       
        scoreForEachRoundTeams.text = player?.name
        //self.scoreForEachRoundTeams.text = "\(String(describing: finalScoreEachRound?.first?.name))"

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return competitions!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreForEachRoundCell" , for: indexPath) as! ScoreForEachRoundTableViewCell
        //  Player.player.name? = highScore?[indexPath.row].score
       
        cell.textLabel?.text = competitions?[indexPath.row].comepetitionsOption
        //cell.scoreforEachRoundLabel.text = String(player![indexPath.row].score)
        //cell.scoreforEachRoundLabel.text = ("\(String(describing: player?.scoreForEachRound))")
        cell.scoreforEachRoundLabel.text = ("\(String(describing: player?.scoreForEachRound))")
        //cell.scoreforEachRoundLabel.text = String(player![indexPath.row].scoreForEachRound)
//        if let score = player?[indexPath.row] {
//                   cell.scoreforEachRoundLabel.text = String("\(score)")
//              }
//

        
        return cell
    }

    @IBAction func closeScoreForEachRound(_ sender: UIButton) {
        
              dismiss(animated: true, completion: nil)
    }
    

}
