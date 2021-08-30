//
//  GreetingsScreenViewController.swift
//  3_Segue
//
//  Created by Ravil on 25.08.2021.
//

import UIKit

class GreetingsScreenViewController: UIViewController {

    @IBOutlet weak var greetingsLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text = "Hello \(user.person.fullName)!"
    }
}
