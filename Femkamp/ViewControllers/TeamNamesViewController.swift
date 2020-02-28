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
    @IBOutlet weak var keyboardConstrains: NSLayoutConstraint!
    @IBOutlet weak var addButtonImage: UIButton!
    @IBOutlet weak var moveForwardArrow: UIButton!
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var tableViewTeams: UITableView!
    var newPlayer : [Player] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Keybaord will automatic show when page opens
        inputNameTextField.becomeFirstResponder()
        inputNameTextField.delegate = self
        
    }
    //calling function keyboardWillShown
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver( self, selector: #selector(keyboardWillShown(notification:)), name:  UIResponder.keyboardWillShowNotification, object: nil )
    }
    //Remove Keyboard
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver( self,name:  UIResponder.keyboardWillShowNotification, object: nil )
    }
    // Counts number of row in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newPlayer.count
    }
    // Design and structure for tableview/cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTeamCell, for: indexPath)
        cell.textLabel?.text = newPlayer[indexPath.row].name
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        return cell
    }
    
    //Set animation to button
    @IBAction func moveToCompetitions(_ sender: UIButton) {
        
        if newPlayer.isEmpty {
            sender.shake()
        }else{
            sender.pulsate()
        }
    }
    //button to add team
    @IBAction func AddTeamButton(_ sender: UIButton) {
        
        sender.pulsate()
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
        sender.pulsate()
        
    }
    
    //Append team name to array and tableview
    func InsertNewName(){
        newPlayer.append( Player(name: inputNameTextField.text, score: 0))
        let indexPath = IndexPath(row: newPlayer.count - 1, section: 0)
        tableViewTeams.insertRows(at: [indexPath], with: .automatic)
        print(newPlayer)
    }
    
    //Making datasource editable in tableview
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //delete names from array
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newPlayer.remove(at: indexPath.row)
            tableViewTeams.beginUpdates()
            tableViewTeams.deleteRows(at: [indexPath], with: .automatic)
            tableViewTeams.endUpdates()
        }
    }
    
    //All Information how wants to follow the Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "TeamNamesSegue" {
            let destVC=segue.destination as! ChooiceCompetition
            destVC.players = newPlayer
        }
    }
    
    //If no Teams are add, one alert window will show
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
    
    //Informtion button
    @IBAction func InfoButton(_ sender: UIButton) {
        inputNameTextField.resignFirstResponder()
        sender.pulsate()
    }
    
    //Set the Menu just Above the keyboard whit an animation
    @objc func keyboardWillShown(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            
            if self.view.frame.size.height >= 800{
                self.keyboardConstrains.constant = keyboardFrame.size.height - 34
            }
                
            else {
                self.keyboardConstrains.constant = keyboardFrame.size.height
            }
        })
    }
}



