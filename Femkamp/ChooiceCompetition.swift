//
//  ChooiceCompetition.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-23.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ChooiceCompetition: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
  
    let GameSegue = "StartGameSegue"
    var Comepetition = [Comepetitions]()
    let CellId =  "CellId"
    var selectedGames = [Comepetitions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Comepetition.append(Comepetitions(ComepetitionsOption: "Boll i hink ⚾️",ComepetitionsInfo: "Du kastar bollen i en hink"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Basket 🏀", ComepetitionsInfo: "Kasta bollen i en korg"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Dart 🎯", ComepetitionsInfo: "Kasta pilen på siffran 20"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Luftgevär 🔫", ComepetitionsInfo: "Skjut mot ett mål"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Kasta ring 🧿", ComepetitionsInfo: "kasta ring på en stång"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Kubb 🥢", ComepetitionsInfo: "Kasta ner kubb"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Äggkastarn 🥚", ComepetitionsInfo: "Kasta ägg mot varandra"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Fressbee 🥏", ComepetitionsInfo: "kasta mot en mål"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Boul 🎱", ComepetitionsInfo:  "kasta kulan mot ett mål"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Golf 🎹",ComepetitionsInfo: "sätt bollen nära ett hål"))
        Comepetition.append(Comepetitions(ComepetitionsOption: "Fressbee basket 🥏 + 🏀  ",ComepetitionsInfo: "kasta freesbee i en basket korg"))
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Comepetition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath)
        cell.textLabel?.text = Comepetition[indexPath.row].ComepetitionsOption
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            selectedGames.remove(at: 1)
  
            
            
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            
            selectedGames.append(Comepetition[indexPath.row])
            print(selectedGames)
            
        }
  
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            Comepetition.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let vc = segue.destination as! ViewController
        //vc.questions = [selectedGames]
        // vc.questions = [selectedGames]
        if segue.identifier == "StartGameSegue" {
            let destVC=segue.destination as! ViewController
            destVC.questions = selectedGames
            
        }
    }
}
