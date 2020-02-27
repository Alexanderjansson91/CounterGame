//
//  PopUpViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-17.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var popUpTableView: UITableView!
    var highScore : [Player]?
    let highScorecell = "highScorecell"
    @IBOutlet weak var popUpView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Player.totalScore()
        
        sortHighScoreArray()
        popUpView.layer.cornerRadius = 26
        popUpView.clipsToBounds = true
        
    }
    
    //counts rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScore!.count
    }
    
    // Design and structure for tableviewcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "highScorecell" , for: indexPath) as! HighScoreTableViewCell
        //  Player.player.name? = highScore?[indexPath.row].score
        cell.textLabel?.text = highScore?[indexPath.row].name
        cell.highScoreLabel.text = String(highScore![indexPath.row].totalScore())
        
        return cell
    }
    
    //Close PopUp window
    @IBAction func closePopUp(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    //Sort highscore array
    func sortHighScoreArray(){
        
        _ = highScore?.sort(by: { $0.totalScore() > $1.totalScore()})
        for player in (highScore)!{
            print(player.scoreForEachRound)
        }
        self.popUpTableView.reloadData()

    }
}
