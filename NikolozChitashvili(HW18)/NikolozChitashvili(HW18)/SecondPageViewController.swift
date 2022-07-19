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
    
    var imageStartHeight: CGFloat? = nil
    var imageStartWidth: CGFloat? = nil
    var longPressedImage: Bool = false
    var isImageHidden: Bool = false
    var shouldGoBackWork: Bool = true
    let moveBy: CGFloat = 50
    
    let texts = [
        "redCircle": "If you press this image less than 1 sec, you will go back where you came from!",
        "blueCircle": "If you press this image for more than 1 sec, it will disappear",
        "purpleTriangle": "Swipe left, right, up or down and image will change accordingly",
        "blackTriangle": "Try to pinch the image"
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
            case .blackTriangle:
                setUpBlackTriangle()
            case .purpleTriangle:
                setUpPurpleTriangle()
            default:
                // do nothin
                print("LOG", "Oppssssieee!!1")
        }
    }
    
    private func setUpBlackTriangle() {
        shouldGoBackWork = false
        imageStartHeight = imageView.frame.height
        imageStartWidth  = imageView.frame.width
        self.navigationItem.setHidesBackButton(false, animated: true)
        let pnchGest = UIPinchGestureRecognizer(target: self, action: #selector(pinchedImage))
        imageView.addGestureRecognizer(pnchGest)
    }
    
    private func setUpPurpleTriangle() {
        shouldGoBackWork = false
        setCorrectSize()
        self.navigationItem.setHidesBackButton(false, animated: true)
        let swpDwnGest = UISwipeGestureRecognizer(target: self, action: #selector(swipedDwnImage))
        swpDwnGest.direction = .down
        let swpUpGest = UISwipeGestureRecognizer(target: self, action: #selector(swipedUpImage))
        swpUpGest.direction = .up
        let swpLeftGest = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeftImage))
        swpLeftGest.direction = .left
        let swpRightGest = UISwipeGestureRecognizer(target: self, action: #selector(swipedRightImage))
        swpRightGest.direction = .right
        imageView.addGestureRecognizer(swpDwnGest)
        imageView.addGestureRecognizer(swpUpGest)
        imageView.addGestureRecognizer(swpLeftGest)
        imageView.addGestureRecognizer(swpRightGest)
    }
    
    private func setCorrectSize() {
        let scale = 0.7
        // -- :)
        imageView.transform = (imageView.transform.scaledBy(x: scale, y: scale))
    }
    
    @objc private func swipedDwnImage(gesture: UIPinchGestureRecognizer) {
        imageView.center.y += moveBy
    }
    @objc private func swipedUpImage(gesture: UIPinchGestureRecognizer) {
        imageView.center.y -= moveBy
    }
    @objc private func swipedLeftImage(gesture: UIPinchGestureRecognizer) {
        imageView.center.x -= moveBy
    }
    @objc private func swipedRightImage(gesture: UIPinchGestureRecognizer) {
        imageView.center.x += moveBy
    }
    
    @objc private func pinchedImage(gesture: UIPinchGestureRecognizer) {
        if gesture.state == .ended {
            if gesture.view?.frame.maxY ?? 0 > view.frame.height {
                let startHeight = imageStartHeight ?? 0
                // Some big calculus going on here
                gesture.scale = startHeight / (gesture.view?.frame.height ?? startHeight)
                // -- :)
                gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
            }
        }
        else if gesture.state == .began || gesture.state == .changed {
            gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
            gesture.scale = 1
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
        if !isImageHidden && shouldGoBackWork {
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
