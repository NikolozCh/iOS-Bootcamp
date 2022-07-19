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
    var purpleTR: TriangleButtonView? = nil
    var blackTR: TriangleButtonView? = nil
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var triangleView: UIView!
    @IBOutlet weak var triangleViewSecond: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setRoundedCorners()
        drawRectangle()
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

    private func drawRectangle()
    {
        
        purpleTR = TriangleButtonView(frame: CGRect(x: 0, y: 0, width: triangleView.frame.width, height: triangleView.frame.height), color: .purple)
        
        blackTR = TriangleButtonView(frame: CGRect(x: 0, y: 0, width: triangleView.frame.width, height: triangleView.frame.height), color: .black)
        
        guard
            let purpleTR = purpleTR,
            let blackTR = blackTR
        else {
            return
        }

        triangleView.addSubview(purpleTR)
        purpleTR.backgroundColor = .systemBackground
                
        triangleViewSecond.addSubview(blackTR)
        blackTR.backgroundColor = .systemBackground
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if let trView = touch.view as? UIButton {
                print("No")
                if trView == purpleTR {
                    print("Purple")
                }
                else {
                    print("Black")
                }
            }
            print(touch.view)
        }
    }
    
}

