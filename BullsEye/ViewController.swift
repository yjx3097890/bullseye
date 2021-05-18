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
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
        
        resetGame()
        
    }
    
   
    @IBAction func showAlert() {
        
        let diff = abs(targetValue - value)
        var points = 100 - diff
        let title: String

        
        switch diff {
            case 0:
                title = "Perfect"
                points += 100
            case 0...5:
                title = "You almost had it!"
                if diff == 1 {
                    points += 50
                }
            case 5...10:
                title = "Pretty good!"
            default:
                title = "笨猪"
        }
        
        totalScore += points
        round += 1
        
        let message = "Your score is \(points)."

        
          let alert = UIAlertController(
            title:  title,
            message: message,
            preferredStyle: .alert)

          let action = UIAlertAction(
            title: "OK",
            style: .default) {(_) in
            self.startNewGame()
          }

          alert.addAction(action)
          present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        value = lroundf(slider.value)
    }
    
    @IBAction func resetGame() {
        totalScore = 0
        round = 1
        startNewGame()
        
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        view.layer.add(transition, forKey: nil)
        
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

