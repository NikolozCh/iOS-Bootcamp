//
//  ViewController.swift
//  NikolozChitashvili(HW14)
//
//  Created by Nikoloz Chitashvili on 09.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private var regUsername: String? = nil
    private var regPassword: String? = nil
    private var regEmail: String? = nil
    private var userRegistered: Bool = false // I know I can if let, but I prefer this way. More readable
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameField.becomeFirstResponder()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        if(!userRegistered) {
            notifyError(with: "Please register and come back later :)")
            return
        }

        guard
            let usernameText = usernameField.text,
            let passwordText = passwordField.text
        else {
            notifyError(with: "Please check input fields!")
            return
        }

        if(usernameText != regUsername || passwordText != regPassword) {
            notifyError(with: "Username or Password is incorrect")
            return
        }
        
        usernameField.text = ""
        passwordField.text = ""
        
        // Otherwise, we perform segue : )
        // Everything looks great so far
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segID = segue.identifier {
            if segID == "toRegistration" {
                let vc = segue.destination as! RegistrationViewController
                vc.delegate = self
            }
            else if segID == "toDetails" {
                let vc = segue.destination as! DetailsViewController
                vc.username = regUsername
                vc.email = regEmail
            }
        }
    }
    
    private func notifyError(with text: String) -> Void {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: RegistrationDelegate {
    func putRegistrationData(username: String, password: String, email: String) {
        regUsername = username
        regPassword = password
        regEmail = email
        userRegistered = true
    }
    
}
