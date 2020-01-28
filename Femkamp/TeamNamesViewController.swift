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
    
    @IBOutlet weak var InputNameTextField: UITextField!
    @IBOutlet weak var TableViewTeams: UITableView!
   // var person = Player(name: nil, score: 0)
    //var NewPLayer: [Player?] = []
    var NewPlayer : [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputNameTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewPlayer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTeamCell, for: indexPath)
        cell.textLabel?.text = NewPlayer[indexPath.row].name
        return cell
        
        
    }
    
    @IBAction func AddTeamButton(_ sender: UIButton) {
        
        InsertNewName()
        if NumberOfTeams + 1 < NewPlayer.count {
            NumberOfTeams += 1
            InputNameTextField?.text = NewPlayer[NumberOfTeams].name
        } else {
            NumberOfTeams = 0
        }
    }
    
    func InsertNewName(){
        //NewPLayer.append(InputNameTextField.text!)
        NewPlayer.append( Player(name: InputNameTextField.text, score: 0))

        
        let indexPath = IndexPath(row: NewPlayer.count - 1, section: 0)
        
        //TableViewTeams.beginUpdates()
        TableViewTeams.insertRows(at: [indexPath], with: .automatic)
        //TableViewTeams.endUpdates()
        
        InputNameTextField.text = ""
        view.endEditing(true)
        
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
}
