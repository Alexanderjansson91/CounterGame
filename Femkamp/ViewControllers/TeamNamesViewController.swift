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
    @IBOutlet weak var moveForwardArrow: UIButton!
  
    
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var tableViewTeams: UITableView!
    //var person = Player(name: nil, score: 0)
    var newPlayer : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNameTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    @objc func keyboardWillShow(sender: NSNotification) {
         self.inputNameTextField.frame.origin.y = -40 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.inputNameTextField.frame.origin.y = 0 // Move view to original position
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newPlayer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTeamCell, for: indexPath)
        cell.textLabel?.text = newPlayer[indexPath.row].name
        return cell
    }
    
    //button to add team
    @IBAction func AddTeamButton(_ sender: UIButton) {
        
        InsertNewName()
        if NumberOfTeams + 1 < newPlayer.count {
            NumberOfTeams += 1
            inputNameTextField?.text = newPlayer[NumberOfTeams].name
        } else {
            NumberOfTeams = 0
        }
        inputNameTextField.text = nil
        view.endEditing(true)
        inputNameTextField.becomeFirstResponder()
        
    }

    func InsertNewName(){
        
        newPlayer.append( Player(name: inputNameTextField.text, score: 0))
        let indexPath = IndexPath(row: newPlayer.count - 1, section: 0)
        tableViewTeams.insertRows(at: [indexPath], with: .automatic)
     
      //  SaveTeams(["\([newPlayer])"])
        print(newPlayer)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newPlayer.remove(at: indexPath.row)
            tableViewTeams.beginUpdates()
            tableViewTeams.deleteRows(at: [indexPath], with: .automatic)
            tableViewTeams.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
           if segue.identifier == "TeamNamesSegue" {
               let destVC=segue.destination as! ChooiceCompetition
               destVC.players = newPlayer
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        
        if newPlayer.isEmpty == true {
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
        inputNameTextField.resignFirstResponder()
    }
    
//    func SaveTeams(_:[ String ]){
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(newPlayer), forKey:"players")
//    }
}
 

