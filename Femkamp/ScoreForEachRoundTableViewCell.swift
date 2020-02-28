//
//  ScoreForEachRoundTableViewCell.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-21.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ScoreForEachRoundTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scoreforEachRoundLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*
         This my Tableviewcell for the finalresualt for each gameround.
         */
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
