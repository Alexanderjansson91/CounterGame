//
//  ConfirmGamePopUpViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-24.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ConfirmGamePopUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var comepetition = [Comepetitions]() //Tävlingar
    var players = [Player]()//Spelare
    
    let sections = ["Tävlingar","Spelare"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0) {
            return comepetition.count
        } else {
            return players.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let cell = tableView.dequeueReusableCell(withIdentifier: "ConconfirmCell", for: indexPath)
          if (indexPath.section == 0) {
        cell.textLabel?.text = comepetition[indexPath.row].comepetitionsOption
          }else{
        cell.textLabel?.text = players[indexPath.row].name
            }
         cell.textLabel?.textColor = UIColor.white
         cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
         return cell
    }
    
    //All Information how wants to follow the Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //Segue for start a new game
        if segue.identifier == "startNewGameSegue" {
            let destVC=segue.destination as! GameViewController
            destVC.competitions = comepetition as [Comepetitions]
            
            destVC.players = players
            
        }
    }
}
