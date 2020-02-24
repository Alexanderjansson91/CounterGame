//
//  ResultTableViewCell.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-05.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    var player : Player?
    @IBOutlet weak var scoreForEachRoundPopUp: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*
         This my Tableviewcell for th finalscore
        */
        
        
        //set the label to players finalscore
        finalScoreLabel.text = "\(String(describing: player?.score))"

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
   
    

}
