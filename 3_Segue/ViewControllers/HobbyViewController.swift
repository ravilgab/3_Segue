//
//  HobbyViewController.swift
//  3_Segue
//
//  Created by Ravil on 29.08.2021.
//

import UIKit

class HobbyViewController: UIViewController {
    
    @IBOutlet weak var myHobbyLabel: UILabel!
    
    var myHobbyText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myHobbyLabel.text = myHobbyText
    }
    

}
