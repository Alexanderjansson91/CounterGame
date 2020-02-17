//
//  PopUpViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-17.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var highScore : [Player]?
    let highScorecell = "highScorecell"
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return highScore!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "highScorecell" , for: indexPath) //as! HighScoreTableViewCell
              cell.textLabel?.text = highScore?[indexPath.row].name
              //cell.finalScoreLabel.text = String(finalResualt![indexPath.row].score)
        return cell
    }
    



}
