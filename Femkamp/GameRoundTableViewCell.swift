//
//  GameRoundTableViewCell.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-03.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class GameRoundTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper? 
    

    var index: IndexPath?
    var player : Player?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*
        This my Tableviewcell for the gameround
        */
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //Stepper how sets value of score
    @IBAction func StepperCounter(_ sender: UIStepper) {
        player?.score = Int(sender.value)
        scoreLabel.text = String(Int(sender.value))
    }
    
}
