//
//  DetailsViewController.swift
//  NikolozChitashvili(HW14)
//
//  Created by Nikoloz Chitashvili on 10.07.22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var username: String? = nil
    var email: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true // :)
        
        guard
            let usText = username,
            let emText = email
        else {
            usernameLabel.text = "NaN"
            emailLabel.text = "NaN"
            return
        }
        
        usernameLabel.text = usText
        emailLabel.text = emText
    }
    
    @IBAction func singOutClicked(_ sender: Any) {
//        navigationController?.popToRootViewController(animated: true)
    }
}
