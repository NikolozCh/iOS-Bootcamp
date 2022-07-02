//
//  ViewController.swift
//  LectureApp
//
//  Created by Nikoloz Chitashvili on 01.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ourLabel: UILabel!
    let uiColor: [UIColor] = [.blue, .brown, .cyan, .red]
    var appColor: UIColor?
    var labelColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changeAppBackground(_ sender: Any) {
        appColor = uiColor.randomElement() ?? .white
        if(appColor == labelColor) {
            ourLabel.text = "Same color"
        }
        else {
            ourLabel.text = "My text"
        }
        self.view.backgroundColor =  appColor
    }
    @IBAction func changeLabelBackground(_ sender: Any) {
        labelColor = uiColor.randomElement() ?? .black
        if(appColor == labelColor) {
            ourLabel.text = "Same color"
        }
        else {
            ourLabel.text = "My text"
        }
        ourLabel.backgroundColor = labelColor
    }
}
