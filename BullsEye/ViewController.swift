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
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var value = 0
    var targetValue = 0
    var totalScore = 0
    var round = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
       startNewGame()
    }
    
   
    @IBAction func showAlert() {
        
        let diff = abs(targetValue - value)
        let points = 100 - diff
        totalScore += points
        round += 1
        
//        let message = "The value of the slider is: \(value).\n" +
//        "The target value is: \(targetValue).\n" +
//        "The difference is: \(diff) "
        
        let message = "Your score is \(points)."

        
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
        scoreLabel.text = String(totalScore)
        roundLabel.text = String(round)
    }
  
}

