//
//  BottomSheetPageViewController.swift
//  NikolozChitashvili(HW14)
//
//  Created by Nikoloz Chitashvili on 10.07.22.
//

import UIKit

class BottomSheetPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    @IBAction func yesClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func noClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
