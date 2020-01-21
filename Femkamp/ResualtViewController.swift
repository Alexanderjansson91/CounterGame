//
//  ResualtViewController.swift
//  Femkamp
//
//  Created by Alexander Jansson on 2020-01-20.
//  Copyright © 2020 Alexander Jansson. All rights reserved.
//

import UIKit

class ResualtViewController: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    var finalName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text = finalName
        
        
    }
    

}
