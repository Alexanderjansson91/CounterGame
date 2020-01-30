//
//  GameViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-30.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate {
  
    
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var PickerViewScore: UIPickerView!
    let GameCellId = "GameCellId"
    var player : [Player]?
    var questions : [Comepetitions]?
    private var ScoreValues = (1...100).map{$0}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return player!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameCellId, for: indexPath)
        cell.textLabel?.text = player?[indexPath.row].name
               return cell
    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//          return 1
//      }
//func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//     return ScoreValues.count
//   }
//  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//       return  "\(ScoreValues[row])"
//   }
//  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//       if pickerView == PickerViewScore {
//           ScoreLabel.text = ("\(ScoreValues[row])")
//      }
//
//  }

}
