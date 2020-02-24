//
//  ChooiceCompetition.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-23.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ChooiceCompetition: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonChoice: UIButton!
    let gameSegue = "StartGameSegue"
    var comepetition = [Comepetitions]()
    let cellId =  "CellId"
    var selectedGames = [Comepetitions]()
    var players : [Player] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonChoice.layer.cornerRadius = 26
        buttonChoice.clipsToBounds = true
        
        //Object for my comepetition array
        if  comepetition.count == 0 {
            comepetition.append(Comepetitions(ComepetitionsOption: "Boll i hink ⚾️",ComepetitionsInfo: "Använd en valfri hink och boll. välj ett avstånd från hinken som passar alla spelare. Alla spelare kastar tre gånger i var och registera sedan totalt antal träffar per lag."))
            comepetition.append(Comepetitions(ComepetitionsOption: "Basket 🏀", ComepetitionsInfo: "Kasta bollen i en korg"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Dart 🎯", ComepetitionsInfo: "Kasta pilen på siffran 20"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Luftgevär 🔫", ComepetitionsInfo: "Skjut mot ett mål"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Kasta ring 🧿", ComepetitionsInfo: "kasta ring på en stång"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Kubb 🥢", ComepetitionsInfo: "Kasta ner kubb"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Äggkastarn 🥚", ComepetitionsInfo: "Kasta ägg mot varandra"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Fressbee 🥏", ComepetitionsInfo: "kasta mot en mål"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Boul 🎱", ComepetitionsInfo:  "kasta kulan mot ett mål"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Golf 🎹",ComepetitionsInfo: "sätt bollen nära ett hål"))
            comepetition.append(Comepetitions(ComepetitionsOption: "Fressbee basket 🥏 + 🏀  ",ComepetitionsInfo: "kasta freesbee i en basket korg"))
        }
    }
    //counts number of rows in array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comepetition.count
    }
    // Design and structure for tableviewcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = comepetition[indexPath.row].comepetitionsOption
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        return cell
    }
    //select and unselect, if row is unselected remove from selectedGames else append to selectedGames
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
           //  saveArray ()
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
            selectedGames.remove(at: 0)
            }
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            selectedGames.append(comepetition[indexPath.row])
        }
    }
    //refresh tableView
    func refresh(){
        tableView.reloadData()
    }
    //Making datasource editable in tableview
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //if Row is
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            comepetition.remove(at: indexPath.row)
            tableView.reloadData()
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
 
    //Button to go back to "TeamNamesViewController"
    @IBAction func goBackToTeams(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    //All Information how wants to follow the Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //Segue for start a new game
        if segue.identifier == "StartGameSegue" {
            let destVC=segue.destination as! GameViewController
            destVC.competitions = selectedGames
            print(selectedGames.count)
            destVC.players = players
            print(players.count)
        }
        //Segue for add a new competition
        if segue.identifier == "AddNewGame" {
            let destVC2=segue.destination as! AddCompetitionViewController
            destVC2.competitions = comepetition
            destVC2.players = players
        }
    }
    
    //If no competitions are add when segue "StartGameSegue" run, one alert window will show
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool{
    if identifier == "StartGameSegue" {
        if selectedGames.isEmpty == true {
            let alert = UIAlertController(title: "‼️", message: "Var vänlig och välj en gren", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                alert.dismiss(animated: true, completion: nil)}))
            present(alert, animated: true,completion: nil)
            return false
        }
        else {
            return true
        }
    }
        return true
  }
}

