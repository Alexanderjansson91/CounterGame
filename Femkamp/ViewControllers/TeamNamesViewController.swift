//
//  TeamNamesViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-27.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class TeamNamesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    var NumberOfTeams = 0
    let NewTeamCell =  "NewTeamCell"

    
    @IBOutlet weak var addButtonImage: UIButton!
    @IBOutlet weak var MoveForwardArrow: UIButton!
    
    
    @IBOutlet weak var InputNameTextField: UITextField!
    @IBOutlet weak var TableViewTeams: UITableView!
    var person = Player(name: nil, score: 0)
    var NewPlayer : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputNameTextField.becomeFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewPlayer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTeamCell, for: indexPath)
        cell.textLabel?.text = NewPlayer[indexPath.row].name
        return cell
    }
    
    //button to add team
    @IBAction func AddTeamButton(_ sender: UIButton) {
        
        InsertNewName()
        if NumberOfTeams + 1 < NewPlayer.count {
            NumberOfTeams += 1
            InputNameTextField?.text = NewPlayer[NumberOfTeams].name
        } else {
            NumberOfTeams = 0
        }
        InputNameTextField.text = nil
        view.endEditing(true)
        InputNameTextField.becomeFirstResponder()
        
    }

    func InsertNewName(){
        
        NewPlayer.append( Player(name: InputNameTextField.text, score: 0))
        let indexPath = IndexPath(row: NewPlayer.count - 1, section: 0)
        TableViewTeams.insertRows(at: [indexPath], with: .automatic)
     
        SaveTeams(["\([NewPlayer])"])
        print(NewPlayer)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            NewPlayer.remove(at: indexPath.row)
            TableViewTeams.beginUpdates()
            TableViewTeams.deleteRows(at: [indexPath], with: .automatic)
            TableViewTeams.endUpdates()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
           if segue.identifier == "TeamNamesSegue" {
               let destVC=segue.destination as! ChooiceCompetition
               destVC.Players = NewPlayer
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        
        if NewPlayer.isEmpty == true {
            let alert = UIAlertController(title: "‼️", message: "Var vänlig och lägg till lag", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                alert.dismiss(animated: true, completion: nil)}))
            present(alert, animated: true,completion: nil)
            return false
        }
        else {
            return true
        }

    }
    
    @IBAction func InfoButton(_ sender: UIButton) {
        InputNameTextField.resignFirstResponder()
    }
    
    func SaveTeams(_:[ String ]){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(NewPlayer), forKey:"players")
    }
}
 

