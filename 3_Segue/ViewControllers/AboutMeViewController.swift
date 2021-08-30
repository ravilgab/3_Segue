//
//  AboutMeViewController.swift
//  3_Segue
//
//  Created by Ravil on 29.08.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var aboutMeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = user.person.about
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreAboutMeVC = segue.destination as? MoreAboutMeViewController else { return }
        moreAboutMeVC.user = user
    }
}
