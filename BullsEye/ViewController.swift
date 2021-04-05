//
//  ViewController.swift
//  BullsEye
//
//  Created by Sergey Lukaschuk on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property game
    
    /// Stores of the slider value
    var currentValue: Int = 0
    
    /// The random number that user will guess
    var targetValue = 0
    
    /// Variable saves a common account
    var score = 0
    
    /// Round current game
    var round = 0
    
    
    
    // MARK: - IBOutlet
    
    /// Label for the number to be guessed
    @IBOutlet var targetLabel: UILabel!
    
    /// Label for the slider
    @IBOutlet var slider: UISlider!
    
    /// Label for the score
    @IBOutlet weak var scoreLabel: UILabel!
    
    /// Label for the round game
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    
    
    // MARK: - Method game
    
    /// Creates a new game, and sets the default value
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    /// Method that updates target value
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    
    // MARK: - IBAction
    
    /// By pressing the button calls the alert window with action
    @IBAction func showAlert() {
        
        /// The difference between the slider and random value
        let difference = abs(currentValue - targetValue)
        
        /// The number of points that receive the user.
        let points = 100 - difference
        
        score += points
        
        /// Message for alert 'showAlert'
        let message = "You scored \(points) points"
        
        /// The alert title
        var title: String {
            if difference == 0 {
                return "Perfect!"
            } else if difference < 5 {
                return "You almost had it!"
            } else if difference < 10 {
                return "Pretty good!"
            } else {
                return "Not even close..."
            }
        }
        
        let alert = UIAlertController(
            title: title,
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
