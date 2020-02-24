//
//  FinalResultViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-05.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class FinalResultViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var finalScoreTableView: UITableView!
    @IBOutlet weak var startNewGame: UIButton!
    let finalScoreCell = "finalScoreCell"
    var comepetition = [Comepetitions]()
    var finalResualt : [Player]?
    var emoji = ["🥇","🥈","🥉",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame.layer.cornerRadius = 26
        startNewGame.clipsToBounds = true
        
        
        guard let players = finalResualt else {return}
        
        // Counts array "scoreForEachRound"
        for player in players {
            for score in player.scoreForEachRound{
                player.score += score
            }
        }
        self.sortArray()
    }
    
    //counts number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalResualt!.count
    }
    
    // Height of tableview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 70
     }
    
    // Design and structure for tableviewcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: finalScoreCell, for: indexPath) as! ResultTableViewCell
        cell.textLabel?.text = finalResualt?[indexPath.row].name
        cell.finalScoreLabel.text = String(finalResualt![indexPath.row].score)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        return cell
    }
    // Sort array by highest result
    func sortArray(){
        finalResualt?.sort()
        self.finalScoreTableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)   {

        if segue.identifier == "finalScoreEachRoundSegue"{
            let vc2 = segue.destination as! FinalResultPopUpViewController
            vc2.finalScoreEachRound = self.finalResualt
            vc2.competitions = self.comepetition
        }
    }
    
}
