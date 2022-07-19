//
//  SecondPageViewController.swift
//  NikolozChitashvili(HW18)
//
//  Created by Nikoloz Chitashvili on 19.07.22.
//

import UIKit

class SecondPageViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var longPressedImage: Bool = false
    var isImageHidden: Bool = false
    
    let texts = [
        "redCircle": "If you press this image less than 1 sec, you will go back where you came from!",
        "blueCircle": "If you press this image for more than 1 sec, it will disappear"
    ]
    
    var initializer: Performer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideNavigationBackButton()
        setUpEnvironment()
    }

    private func hideNavigationBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func setUpEnvironment() {
        setUpText()
        setUpGesture()
    }
    
    private func setUpText() {
        let textToWrite = getTextBasedInitter()
        informationLabel.text = textToWrite
    }
    
    private func setUpGesture() {
        switch initializer {
            case .redCircle:
                setUpForRedCircle()
            case .blueCircle:
                setUpForBlueCircle()
            default:
                // do nothin
                print("LOG", "Oppssssieee!!1")
        }
    }
    
    private func setUpForRedCircle() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(checkLongPressRed))
        longPressGesture.numberOfTouchesRequired = 1
        longPressGesture.minimumPressDuration = 1
        longPressGesture.delegate = self
        imageView.addGestureRecognizer(longPressGesture)
    }
    
    private func setUpForBlueCircle() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(checkLongPressBlue))
        longPressGesture.numberOfTouchesRequired = 1
        longPressGesture.minimumPressDuration = 1
        longPressGesture.delegate = self
        imageView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func checkLongPressBlue(sender: UILongPressGestureRecognizer) {
        if sender.state == .recognized {
            smashThatImageView()
        }
    }
        
    @objc func checkLongPressRed(sender: UILongPressGestureRecognizer) {
        if sender.state == .recognized {
            longPressedImage = true
        }
    }
    
    private func smashThatImageView() {
        UIView.animate(withDuration: 1, animations: {
            self.imageView.alpha = 0
        }, completion: { compl in
            self.navigationItem.setHidesBackButton(false, animated: true)
            self.informationLabel.text? += "\nPRESS BACK BUTTON!"
            self.isImageHidden = true
        })
    }
    
    private func checkForRecognition() {
        if !longPressedImage {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        longPressedImage = false
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isImageHidden {
            checkForRecognition()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // do nothing
    }
    
    private func getTextBasedInitter() -> String {
        if let initter = initializer {
            return texts[initter.rawValue] ?? ""
        }
        return ""
    }
}
