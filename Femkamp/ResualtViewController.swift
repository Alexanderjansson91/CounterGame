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
    @IBOutlet weak var NameLabel2: UILabel!
    @IBOutlet weak var NameLabel3: UILabel!
    @IBOutlet weak var NameLabel4: UILabel!
    
    @IBOutlet weak var ResualtLabel1: UILabel!
    @IBOutlet weak var ResualtLabel2: UILabel!
    @IBOutlet weak var ResualtLabel3: UILabel!
    @IBOutlet weak var ResualtLabel4: UILabel!
    
    
    var finalName = ""
    var finalName2 = ""
    var finalName3 = ""
    var finalName4 = ""
    
    var finalResualt1 = 0
      var finalResualt2 = 0
      var finalResualt3 = 0
      var finalResualt4 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text = finalName
        NameLabel2.text = finalName2
        NameLabel3.text = finalName3
        NameLabel4.text = finalName4
        
        
        ResualtLabel1.text = "\(finalResualt1)"
        ResualtLabel2.text = "\(finalResualt2)"
        ResualtLabel3.text = "\(finalResualt3)"
        ResualtLabel4.text = "\(finalResualt4)"
        
        
        
       // let total = finalResualt1.reduce(0, +)
        
    }
    

}
