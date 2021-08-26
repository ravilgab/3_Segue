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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.returnKeyType = .next
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetPasswordField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingsScreenVC = segue.destination as? GreetingsScreenViewController else { return }
        
        if (userNameTF.text == "Tim") && (passwordTF.text == "Cook") {
            greetingsScreenVC.greetings = "Hello \(userNameTF.text ?? "")!"
        } else {
            credentialsError()
            resetPasswordField()
        }
    }

    @IBAction func forgotNameButton() {
        let alert = UIAlertController(title: "Oops!", message: "Your user name is Tim", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordButton() {
        let alert = UIAlertController(title: "Oops!", message: "Your password is Cook", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Thanks", style: .default))
        
        present(alert, animated: true)
    }
    
    private func credentialsError() {
        let alert = UIAlertController(title: "Invalid login or password", message: "Please enter correct login and password", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }
    
    private func resetPasswordField() {
        passwordTF.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textTag = textField.tag + 1
        
        let nextResponder = textField.superview?.viewWithTag(textTag)
        
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            self.view.endEditing(true)
        }
        
        return true
    }
}

