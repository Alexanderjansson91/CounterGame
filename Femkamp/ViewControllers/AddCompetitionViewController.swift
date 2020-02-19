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
    @IBOutlet weak var addNewCompetitionTextView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        addNewNameTextView.becomeFirstResponder()
        addNewCompetitionTextView.becomeFirstResponder()
        
        addNewCompetitionTextView.layer.cornerRadius = 10
        addNewCompetitionTextView.clipsToBounds = true
    }
        
    
    @IBAction func Save(_ sender: UIButton) {
        competitions.append( Comepetitions(ComepetitionsOption: addNewNameTextView.text!, ComepetitionsInfo: addNewCompetitionTextView.text))
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
               destVC.comepetition = competitions
               destVC.players = players
        }
    }

}

