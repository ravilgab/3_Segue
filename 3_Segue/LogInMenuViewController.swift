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
    
    private let userName = "Tim"
    private let password = "Cook"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingsScreenVC = segue.destination as? GreetingsScreenViewController else { return }
        greetingsScreenVC.user = userName
    }

    @IBAction func logInPressed() {
        if userNameTF.text != userName || passwordTF.text != password {
            credentialsFailAlert()
        }
    }
    
    
    private func showAlert(title: String ) {
        
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
