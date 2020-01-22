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
    
    var questions = ["omgång 1", "omgång 2", "omgång 3", "omgång 4"]
    
    
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
        //  LabelCompetitions.text = "omgång 1"
        LabelCompetitions.text = questions[currentQuestionIndex]
        
    }
    
    func printNames (){
        NameLabelOne.text =  "\(person1.name)"
        NameLabelTwo.text =  "\(person2.name)"
        NameLabelThree.text =  "\(person3.name)"
        NameLabelFour.text =  "\(person4.name)"
    }
    func CountArray (){
        
        person1.score = resultsPerson1.reduce(0,+)
        person2.score = resultsPerson2.reduce(0,+)
        person3.score = resultsPerson3.reduce(0, +)
        person4.score = resultsPerson4.reduce(0, +)
        //        print("totalSum \(totalSum)")
        //        print("totalSum2 \(totalSum2)")
        //        print("totalSum3 \(totalSum3)")
        //        print("totalSum4 \(totalSum4)")
    }
    func AddArrayWhitPlayerScore (){
        resultsPerson1 = [person1.score]
        resultsPerson2 = [person2.score]
        resultsPerson3 = [person3.score]
        resultsPerson4 = [person4.score]
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
        
        
        
        if currentQuestionIndex + 1 < questions.count {
            
            currentQuestionIndex += 1
            LabelCompetitions.text = questions[currentQuestionIndex ]
        } else {
            currentQuestionIndex = 0
            performSegue(withIdentifier: "ResualtSegue", sender: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        CountArray ()
        let vc = segue.destination as! ResualtViewController
        vc.finalName = self.person1.name
        vc.finalName2 = self.person2.name
        vc.finalName3 = self.person3.name
        vc.finalName4 = self.person4.name
        
        
        print("\(person1.score)")
        vc.finalResualt1 = self.person1.score
        vc.finalResualt2 = self.person2.score
        vc.finalResualt3 = self.person3.score
        vc.finalResualt4 = self.person4.score
        
    }
}
