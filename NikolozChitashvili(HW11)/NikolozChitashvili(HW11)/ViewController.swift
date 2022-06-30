//
//  ViewController.swift
//  NikolozChitashvili(HW11)
//
//  Created by Nikoloz Chitashvili on 30.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    // I suck at UI/UX, sorry
    // Coding and Markup is my only power

    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateRandomValuesForLabels()
        errorLabel.isHidden = true
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        updateRandomValuesForLabels()
    }
    
    @IBAction func processData(_ sender: Any) {
        errorLabel.isHidden = true
        let answers = ["max", "min", "avg"]
        if let fieldText = textFieldData.text {
            if(!answers.contains(fieldText.lowercased())) {
                notifyError(about: "Please, enter 'max', 'min' or 'avg'")
                return;
            }
            var valueToSet = "Requested |"
            switch fieldText {
            case "max":
                valueToSet += "max| value: \(calculateMax())"
            case "min":
                valueToSet += "min| value: \(calculateMin())"
            default:
                valueToSet += "avg| value: \(calculateAvg())"
            }
            updateDataNotifier(value: valueToSet)
            textFieldData.text = ""
        }
        else {
            notifyError(about: "Error occured! Please check the text field is working properly")
        }
        
    }
    
    
    // MARK: - Private section
    private func updateRandomValuesForLabels() {
        let sliderRange = Int(slider.minimumValue.rounded())...Int(slider.value.rounded())
        labelFirst.text  = self.getRandomInt(range: sliderRange)
        labelSecond.text = self.getRandomInt(range: sliderRange)
        labelThird.text  = self.getRandomInt(range: sliderRange)
    }
    
    private func getRandomInt(range: ClosedRange<Int>) -> String {
        let lowValue = range.lowerBound
        let upperValue = range.upperBound
        return String(Int.random(in: lowValue...upperValue))
    }
    // Notofies user about the error occured in the app
    private func notifyError(about err: String) {
        errorLabel.isHidden = false
        errorLabel.text = err
    }
    // Updates data in the label (the calculations)
    private func updateDataNotifier(value str: String) {
        dataLabel.text = str
    }
    // Determines max from 3 numbers
    private func calculateMax() -> Int {
        let valuesFromLabels = getLabelIntValues()
        return valuesFromLabels.sorted(by: >).first ?? -1
    }
    // Determines min from 3 numbers
    private func calculateMin() -> Int {
        let valuesFromLabels = getLabelIntValues()
        return valuesFromLabels.sorted(by: <).first ?? -1
    }
    // Calculates average from 3 numbers
    private func calculateAvg() -> String {
        let valuesFromLabels = getLabelIntValues()
        let allSum = valuesFromLabels.reduce(0) { partialResult, number in
            partialResult + number
        }
        return "\((Double(allSum) / Double(valuesFromLabels.count)).roundToPlaces(places: 2))"
    }
    // Fetches values of Integer labels
    private func getLabelIntValues() -> [Int] {
        var ans: [Int] = []
        ans.append(Int(labelFirst.text!) ?? -1)
        ans.append(Int(labelSecond.text!) ?? -1)
        ans.append(Int(labelThird.text!) ?? -1)
        return ans
    }
}
// from: https://stackoverflow.com/questions/41310420/extension-double-round-to-places-swift-3
extension Double {
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
