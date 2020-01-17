//
//  ViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-16.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    

    @IBOutlet weak var PickerViewScore: UIPickerView!
    
    var person1 = Player(name: "alex", score: nil)
    var person2 = Player(name: "Lisa", score: nil)
    var person3 = Player(name: "Anders", score: nil)
    var person4 = Player(name: "Carola", score: nil)
    
     private var ScoreValues = (1...4).map{$0}
      
    @IBOutlet weak var NameLabelOne: UILabel!
    @IBOutlet weak var NameLabelTwo: UILabel!
    @IBOutlet weak var NameLabelThree: UILabel!
    @IBOutlet weak var NameLabelFour: UILabel!
    
    @IBOutlet weak var ScoreOne: UILabel!
    @IBOutlet weak var ScoreTwo: UILabel!
    @IBOutlet weak var ScoreThree: UILabel!
    @IBOutlet weak var ScoreFour: UILabel!
    
    

    
    var results = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printNames ()
        
       
    }
    
    func printNames (){
        NameLabelOne.text =  "\(person1.name)"
        NameLabelTwo.text =  "\(person2.name)"
        NameLabelThree.text =  "\(person3.name)"
        NameLabelFour.text =  "\(person4.name)"
    }
    func CountScore (){
     
      
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ScoreValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  "\(ScoreValues[row])"
    }
    
    //Pickerview för spelare 1
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
           ScoreOne.text = ("\(ScoreValues[row])")
           
           
       }




}

