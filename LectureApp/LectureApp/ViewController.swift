//
//  ViewController.swift
//  LectureApp
//
//  Created by Nikoloz Chitashvili on 01.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lop: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lop.layer.cornerRadius = 45
    }
}
