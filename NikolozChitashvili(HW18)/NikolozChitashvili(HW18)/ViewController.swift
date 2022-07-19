//
//  ViewController.swift
//  NikolozChitashvili(HW18)
//
//  Created by Nikoloz Chitashvili on 19.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    var seguePerformer: Performer?
    let segueID: String = "nextPage"
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setRoundedCorners()
    }
    
    @IBAction func redViewClicked(_ sender: Any) {
        seguePerformer = .redCircle
        performSegue(withIdentifier: segueID, sender: self)
    }
    
    @IBAction func blueViewClicked(_ sender: Any) {
        seguePerformer = .blueCircle
        performSegue(withIdentifier: segueID, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let id = segue.identifier
        // make sure we are good
        if id == segueID {
            guard
                let vc = segue.destination as? SecondPageViewController
            else {
                return
            }
            vc.initializer = self.seguePerformer
        }
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

