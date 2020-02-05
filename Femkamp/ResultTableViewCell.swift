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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        finalScoreLabel.text = "\(String(describing: player?.score))"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
