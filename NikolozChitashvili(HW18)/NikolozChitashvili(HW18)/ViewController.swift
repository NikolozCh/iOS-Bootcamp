//
//  ViewController.swift
//  NikolozChitashvili(HW18)
//
//  Created by Nikoloz Chitashvili on 19.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setRoundedCorners()
    }
    
    @IBAction func redViewClicked(_ sender: Any) {
        performSegue(withIdentifier: "nextPage", sender: self)
    }
    
    @IBAction func blueViewClicked(_ sender: Any) {
        performSegue(withIdentifier: "nextPage", sender: self)
    }
    
    
    private func setRoundedCorners() {
        setRounded(view: redView)
        setRounded(view: blueView)
    }
    
    private func setRounded(view el: UIView) {
        el.layer.cornerRadius = el.bounds.height / 2
        el.alpha = 0.9
    }
    
}

