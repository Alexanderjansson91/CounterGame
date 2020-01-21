//
//  ViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-16.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var ButtonPressed: UIButton!
    @IBOutlet weak var LabelCompetitions: UILabel!
    
 var currentQuestionIndex = 0
    
   // var Comepetition = [Comepetitions(Comepetitions: "Omgång 1"),Comepetitions(Comepetitions: "Omgång 2"),Comepetitions(Comepetitions: "Omgång 3")]
    var questions = ["1", "2", "3", "4"]

    
    @IBOutlet weak var PickerViewScore2: UIPickerView!
    @IBOutlet weak var PickerViewScore3: UIPickerView!
    @IBOutlet weak var PickerViewScore4: UIPickerView!
    @IBOutlet weak var PickerViewScore: UIPickerView!
    
    
    var person1 = Player(name: "alex", score: 0)
    var person2 = Player(name: "Lisa", score: 0)
    var person3 = Player(name: "Anders", score: 0)
    var person4 = Player(name: "Carola", score: 0)
    
    
    
  
    
    private var ScoreValues = (1...4).map{$0}
    
    @IBOutlet weak var NameLabelOne: UILabel!
    @IBOutlet weak var NameLabelTwo: UILabel!
    @IBOutlet weak var NameLabelThree: UILabel!
    @IBOutlet weak var NameLabelFour: UILabel!
    
    @IBOutlet weak var ScoreOne: UILabel!
    @IBOutlet weak var ScoreTwo: UILabel!
    @IBOutlet weak var ScoreThree: UILabel!
    @IBOutlet weak var ScoreFour: UILabel!
    
    var resultsPerson1 = [Int]()
    var resultsPerson2 = [Int]()
    var resultsPerson3 = [Int]()
    var resultsPerson4 = [Int]()
    
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return ScoreValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  "\(ScoreValues[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == PickerViewScore {
           ScoreOne.text = ("\(ScoreValues[row])")
        } else if pickerView == PickerViewScore2 {
           ScoreTwo.text = ("\(ScoreValues[row])")
        } else if pickerView == PickerViewScore3{
            ScoreThree.text = ("\(ScoreValues[row])")
        } else if pickerView == PickerViewScore4 {
            ScoreFour.text = ("\(ScoreValues[row])")
        }
    }
    
    func SeperatePickerView (){
        NameLabelOne.text = ("\(String(describing: PickerViewScore))")
    }
 
    
    
    @IBAction func NextGameButton(_ sender: UIButton)  {
      
        
        let row = PickerViewScore.selectedRow(inComponent: 0)
      resultsPerson1.append(ScoreValues[row])
        let row2 = PickerViewScore2.selectedRow(inComponent: 0)
            resultsPerson2.append(ScoreValues[row2])
        let row3 = PickerViewScore3.selectedRow(inComponent: 0)
        resultsPerson3.append(ScoreValues[row3])
        let row4 = PickerViewScore4.selectedRow(inComponent: 0)
        resultsPerson4.append(ScoreValues[row4])
       // PickCompetitions ()
        print(resultsPerson1)
        print(resultsPerson2)
        print(resultsPerson3)
        print(resultsPerson4)
        
      LabelCompetitions.text = questions[currentQuestionIndex]
        
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
        } else {
            currentQuestionIndex = 0
            performSegue(withIdentifier: "ResualtSegue", sender: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResualtViewController
        vc.finalName = self.person1.name
    
    }


    }
