//
//  RegistrationViewController.swift
//  NikolozChitashvili(HW14)
//
//  Created by Nikoloz Chitashvili on 10.07.22.
//

import UIKit

protocol RegistrationDelegate {
    func putRegistrationData(username: String, password: String, email: String)
}

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    private var username: String? = nil
    private var password: String? = nil
    private var email: String? = nil
    
    var delegate: RegistrationDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameField.becomeFirstResponder()
    }
    @IBAction func singUpClicked(_ sender: Any) {
        if !fieldsAreFilled() {
            notifyError(with: "One of the fields is empty, please check them")
        }
        delegate?.putRegistrationData(username: (username ?? "NaN"), password: (password ?? "NaN"), email: (email ?? "NaN"))
        navigationController?.popViewController(animated: true)
    }
    
    private func fieldsAreFilled() -> Bool {
        guard
            let emailText = emailField.text,
            let passwordText = passwordField.text,
            let usernameText = usernameField.text
        else {
            return false
        }
        username = usernameText
        password = passwordText
        email = emailText
        return !(emailText.isEmpty || passwordText.isEmpty || usernameText.isEmpty)
    }
    
    private func notifyError(with text: String) -> Void {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
