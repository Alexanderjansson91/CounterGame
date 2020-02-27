//
//  FinalResultPopUpViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-21.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class FinalResultPopUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var viewScoreForEachRound: UIView!
    
    @IBOutlet weak var scoreForEachRoundTeams: UILabel!
    var competitions : [Comepetitions]?
    let scoreForEachRoundCell = "scoreForEachRoundCell"
    var player : Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewScoreForEachRound.layer.cornerRadius = 26
        viewScoreForEachRound.clipsToBounds = true

        scoreForEachRoundTeams.text = player?.name
    }
    
    //Counts number of array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return competitions!.count
        
    }
    
    // Design and structure for tableviewcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreForEachRoundCell" , for: indexPath) as! ScoreForEachRoundTableViewCell

        cell.textLabel?.text = competitions?[indexPath.row].comepetitionsOption
        if let score = player?.scoreForEachRound[indexPath.row] {
            cell.scoreforEachRoundLabel.text = String(score)
        }
        return cell
    }

    //Close button for this page
    @IBAction func closeScoreForEachRound(_ sender: UIButton) {
        
              dismiss(animated: true, completion: nil)
    }
    

}
