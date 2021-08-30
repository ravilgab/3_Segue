//
//  MoreAboutMeViewController.swift
//  3_Segue
//
//  Created by Ravil on 29.08.2021.
//

import UIKit

class MoreAboutMeViewController: UIViewController {

    @IBOutlet weak var imageLabel: UIImageView! {
        didSet {
            imageLabel.layer.cornerRadius = imageLabel.frame.height / 2
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLabel.image = UIImage(named: user.person.image)
    }
}
