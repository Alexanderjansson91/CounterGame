//
//  FinalResultViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-05.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class FinalResultViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var startNewGame: UIButton!
    let finalScoreCell = "finalScoreCell"
    var finalResualt : [Player]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame.layer.cornerRadius = 26
        startNewGame.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalResualt!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: finalScoreCell, for: indexPath)
               cell.textLabel?.text = finalResualt?[indexPath.row].name
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
