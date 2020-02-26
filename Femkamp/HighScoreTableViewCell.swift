//
//  HighScoreTableViewCell.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-02-17.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {

    var player : Player?
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        /*
         This my Tableviewcell for my Higshcore
         */
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
