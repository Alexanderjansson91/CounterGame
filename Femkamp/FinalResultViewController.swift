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
    var finalResualt : [Player]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame.layer.cornerRadius = 26
        startNewGame.clipsToBounds = true
       
        

        self.sortArray()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalResualt!.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: finalScoreCell, for: indexPath) as! ResultTableViewCell
        cell.textLabel?.text = finalResualt?[indexPath.row].name
        cell.finalScoreLabel.text = String(finalResualt![indexPath.row].score)
     
        return cell
        
    }

    func sortArray(){
        finalResualt?.sort()
        self.finalScoreTableView.reloadData()
    }
}
