//
//  ViewController.swift
//  3_Segue
//
//  Created by Ravil on 25.08.2021.
//

import UIKit

class LogInMenuViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let greetingsScreenVC = viewController as? GreetingsScreenViewController {
                greetingsScreenVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutMeVC = navigationVC.topViewController as? AboutMeViewController
                aboutMeVC?.user = user
            }
        }
    }

    @IBAction func logInPressed() {
        if userNameTF.text != user.userName || passwordTF.text != user.password {
            credentialsFailAlert()
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotNamePressed() {
        let alert = UIAlertController(title: "Oops!", message: "Your user name is Tim", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordPressed() {
        let alert = UIAlertController(title: "Oops!", message: "Your password is Cook", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Thanks", style: .default))
        
        present(alert, animated: true)
    }
    
    private func credentialsFailAlert() {
        let alert = UIAlertController(title: "Invalid login or password", message: "Please enter correct login and password", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default))

        present(alert, animated: true)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

extension LogInMenuViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == userNameTF {
                passwordTF.becomeFirstResponder()
            } else {
                logInPressed()
                performSegue(withIdentifier: "showGreetingsScreenVC", sender: nil)
            }
        
            return true
        }
}
