//
//  AddCompetitionViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-06.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class AddCompetitionViewController: UIViewController {
    
    var players : [Player] = []
    var competitions : [Comepetitions] = []
    @IBOutlet weak var addNewNameTextView: UITextField!
    @IBOutlet weak var AddNewCompetitionTextView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        AddNewCompetitionTextView.becomeFirstResponder()
        AddNewCompetitionTextView.becomeFirstResponder()
        AddNewCompetitionTextView.layer.cornerRadius = 26
        AddNewCompetitionTextView.clipsToBounds = true
    }
        
    
    @IBAction func Save(_ sender: UIButton) {
        competitions.append( Comepetitions(ComepetitionsOption: addNewNameTextView.text!, ComepetitionsInfo: AddNewCompetitionTextView.text))
            //CompetitionVC?.refresh()
        //dismiss(animated: true, completion: nil)
        print(competitions)
                            
        
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           if segue.identifier == "saveSegue" {
               let destVC=segue.destination as! ChooiceCompetition
               destVC.Comepetition = competitions
               destVC.Players = players
        }
    }

}

