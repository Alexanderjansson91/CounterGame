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
        
       // fetchArray()
        buttonChoice.layer.cornerRadius = 26
        buttonChoice.clipsToBounds = true
        if  comepetition.count == 0 {
            comepetition.append(Comepetitions(ComepetitionsOption: "Boll i hink ⚾️",ComepetitionsInfo: "Du kastar bollen i en hink"))
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
        print("David")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comepetition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = comepetition[indexPath.row].comepetitionsOption
        
        return cell
    }
    
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
             
            print(selectedGames)

              
            
        }
        
    }
    func refresh(){
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            comepetition.remove(at: indexPath.row)
            tableView.reloadData()
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
//    func saveArray () {
//      UserDefaults.standard.set(comepetition, forKey: "games")
//        let defaults = UserDefaults.standard
//        defaults.set(selectedGames, forKey: "games")
//        defaults.synchronize()
//    }
//    func fetchArray (){
//        if let arr = UserDefaults.standard.array(forKey: "games") as? [String]{
//            print(arr)
//        }
//    }
    @IBAction func goBackToTeams(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let vc = segue.destination as! ViewController
        //vc.questions = [selectedGames]
        // vc.questions = [selectedGames]
        if segue.identifier == "StartGameSegue" {
            let destVC=segue.destination as! GameViewController
            destVC.questions = selectedGames
            print(selectedGames.count)
            
            destVC.players = players
            print(players.count)
            //destVC.CompetitionVC = selectedGames
        }
        if segue.identifier == "AddNewGame" {
            let destVC2=segue.destination as! AddCompetitionViewController
            destVC2.competitions = comepetition
            destVC2.players = players
                  print(selectedGames)
        }
    }
    
    
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

