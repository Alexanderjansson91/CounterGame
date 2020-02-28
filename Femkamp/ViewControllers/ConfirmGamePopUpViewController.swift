//
//  ConfirmGamePopUpViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-24.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ConfirmGamePopUpViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var confirmView: UIView!
    var comepetition = [Comepetitions]() //Tävlingar
    var players = [Player]()//Spelare
    let sections = ["Tävlingar","Spelare"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmView.layer.cornerRadius = 26
        confirmView.clipsToBounds = true
        
    }
    
    //title of the header of the specified section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    //Counts numbers of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    //Count numbers of row for comepetition and players
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0) {
            return comepetition.count
        } else {
            return players.count
        }
    }
    
    //Design and structure for tableview/cell
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
    
    //Design for my sections
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(white: 1.00, alpha: 0.32)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 25.0)
    }
    
    //Close "Confirm" window
    @IBAction func undoConfirmButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //All Information how wants to follow the Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "startNewGameSegue" {
            let destVC=segue.destination as! GameViewController
            destVC.competitions = comepetition as [Comepetitions]
            destVC.players = players
            
        }
    }
}
