//
//  ViewController.swift
//  BullsEye
//
//  Created by Sergey Lukaschuk on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    /// Stores of the slider value
    var currentValue: Int = 0
    
    /// The random number that user will guess
    var targetValue = 0
    
    /// Label for the number to be guessed
    @IBOutlet var targetLabel: UILabel!
    
    /// Label for the slider
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    /// Creates a new game, and sets the default value
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    /// Method that updates target value
    func updateLabels() {
      targetLabel.text = String(targetValue)
    }

    /// By pressing the button calls the alert window with action
    @IBAction func showAlert() {
        
        /// The difference between the slider and random value
        let difference = abs(currentValue - targetValue)
        
        /// Message for alert 'showAlert'
        let message = "The value of the slider is: \(currentValue)"
            + "\nThe target value is: \(targetValue)"
            + "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(
            title: "Hello, Wolrd!",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    /// Slider in which you can select a value in a specified range.
    /// - Parameter slider: UISlider
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        slider.value = Float(currentValue)
    }
}
