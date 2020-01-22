//
//  ChoiceCompetition.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-22.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ChoiceCompetition: UIViewController, UITableViewDataSource {
    
    var Comepetition = [Comepetitions]()
    let personCellId =  "PersonCellId"

    @IBOutlet weak var TableViewComepettition: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
            Comepetition.append(Comepetitions(ComepetitionsOption: "Boll i hink"))
            Comepetition.append(Comepetitions(ComepetitionsOption: "Basket"))
            Comepetition.append(Comepetitions(ComepetitionsOption: "Dart"))
            Comepetition.append(Comepetitions(ComepetitionsOption: "Luftgevär"))
            Comepetition.append(Comepetitions(ComepetitionsOption: "Kasta ring"))
            Comepetition.append(Comepetitions(ComepetitionsOption: "Kubb"))
            Comepetition.append(Comepetitions(ComepetitionsOption: "Äggkastarn"))
            Comepetition.append(Comepetitions(ComepetitionsOption: "Fressbee"))
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return Comepetition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: personCellId, for: indexPath)
       // cell.textLabel?.text = Comepetition [indexPath.row]
        cell.textLabel?.text = Comepetition[indexPath.row].ComepetitionsOption
        
        return cell
    }

}
