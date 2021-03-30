//
//  ViewController.swift
//  BullsEye
//
//  Created by Sergey Lukaschuk on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// By pressing the button calls the alert window with action
    @IBAction func showAlert() {
        let alert = UIAlertController(
            title: "Hello, Wolrd!",
            message: "This is my first app!",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Awesome",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print(#line, "The value of the slider is now: \(slider.value)")
    }
    
    
}
