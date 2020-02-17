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
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func StepperCounter(_ sender: UIStepper) {
        player?.score = Int(sender.value)
        scoreLabel.text = String(Int(sender.value))
        //stepper?.value = 0
    }
    
}
