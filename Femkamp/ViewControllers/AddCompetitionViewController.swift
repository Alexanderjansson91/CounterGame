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
    @IBOutlet weak var addCompetitionConstrain: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Keybaord will automatic show when page opens
        addNewNameTextView.becomeFirstResponder()
        addNewCompetitionTextView.layer.cornerRadius = 10
        addNewCompetitionTextView.clipsToBounds = true
    }
    
    //calling function keyboardWillShown
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver( self, selector: #selector(keyboardWillShown(notification:)), name:  UIResponder.keyboardWillShowNotification, object: nil )
    }
    //Remove Keyboard
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver( self,name:  UIResponder.keyboardWillShowNotification, object: nil )
    }
        
    // Save new competition in "competitions"
    @IBAction func Save(_ sender: UIButton) {
        competitions.append( Comepetitions(ComepetitionsOption: addNewNameTextView.text!, ComepetitionsInfo: addNewCompetitionTextView.text))
    }
    //Cancel if you wantt to Undo
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    
    //Set the Menu just Above keybaord whit an animation
    @objc func keyboardWillShown(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            //self.keyboardConstrains.constant = keyboardFrame.size.height
            
            if self.view.frame.size.height >= 800{ //For bigger screens (X ,11)
                self.addCompetitionConstrain.constant = keyboardFrame.size.height - 24
            }
            else {
                self.addCompetitionConstrain.constant = keyboardFrame.size.height + 10
            }
        })
    }
    //All Information how wants to follow the Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           if segue.identifier == "saveSegue" {
               let destVC=segue.destination as! ChooiceCompetition
               destVC.comepetition = competitions
               destVC.players = players
        }
    }

}

