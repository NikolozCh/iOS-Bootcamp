//
//  ViewController.swift
//  NikolozChitashvili(HW11)
//
//  Created by Nikoloz Chitashvili on 30.06.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateRandomValuesForLabels()
    }


    // MARK: - Private section
    private func updateRandomValuesForLabels() {
        labelFirst.text  = self.getRandomInt()
        labelSecond.text = self.getRandomInt()
        labelThird.text  = self.getRandomInt()
    }
    
    private func getRandomInt() -> String {
        let lowValue = 0
        let upperValue = 100
        return String(Int.random(in: lowValue...upperValue))
    }
}

