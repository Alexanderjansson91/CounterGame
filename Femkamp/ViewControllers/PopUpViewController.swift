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
//    var highScore :  [Player]? = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let players = highScore else {return}
        
        
//        for player in players {
//            for score in player.scoreForEachRound{
//                //player.score += score
//            }
 //       }
        
        
        sortHighScoreArray()
        popUpView.layer.cornerRadius = 26
        popUpView.clipsToBounds = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return highScore!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "highScorecell" , for: indexPath) as! HighScoreTableViewCell
        //  Player.player.name? = highScore?[indexPath.row].score
        cell.textLabel?.text = highScore?[indexPath.row].name
        cell.highScoreLabel.text = String(highScore![indexPath.row].totalScore())
        
        return cell
    }
    
    
    @IBAction func closePopUp(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func sortHighScoreArray(){
        highScore?.sort()
        
        self.popUpTableView.reloadData()
        
    }
    
    
}
