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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// By pressing the button calls the alert window with action
    @IBAction func showAlert() {
        
        /// Message for alert 'showAlert'
        let message = "The value of the slider is: \(currentValue)"
        
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
    }
    
    /// Slider in which you can select a value in a specified range.
    /// - Parameter slider: UISlider
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    
}
