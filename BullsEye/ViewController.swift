//
//  ViewController.swift
//  BullsEye
//
//  Created by yanjixian on 2021/5/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    
    var value = 0
    var targetValue = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
       startNewGame()
    }
    
   
    @IBAction func showAlert() {
        
        let message = "The value of the slider is: \(value).\n" +
        "The target value is: \(targetValue)"

        
          let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)

          let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: {_ in self.startNewGame()})

          alert.addAction(action)
          present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        value = lroundf(slider.value)
    }
    
    func startNewGame() {
        targetValue = Int.random(in: 1...100)
        value = 50
        slider.value = Float(value)
        updateLabels()
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
  
}

