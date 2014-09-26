//
//  ViewController.swift
//  BullsEye
//
//  Created by Olivier Robert on 25/9/14.
//  Copyright (c) 2014 Olibob Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  var currentValue: Int = 0
  var targetValue: Int = 0
  var score: Int = 0
  var round: Int = 0

  @IBOutlet weak var bullSlider: UISlider!
  @IBOutlet weak var bullRandomNumberLabel: UILabel!
  @IBOutlet weak var bullScore: UILabel!
  @IBOutlet weak var bullRound: UILabel!
  
  @IBAction func showAlert(sender: UIButton) {
    // Calculate difference between current value and target value
    let difference: Int = abs(currentValue - targetValue)
    var points = 100 - difference
    
    var title = ""
    if difference == 0 {
      title = "Incredible! Spot on!"
      points += 100      // Additional 100 points when the user hits the target value
    } else if difference <= 3 {
      title = "Wow, that was close!"
      if difference == 1 {
        points += 50
      }
    } else if difference <= 6 {
      title = "Pretty good!"
    } else if difference <= 10 {
      title = "Not bad"
    } else {
      title = "mmm, you can do better ;-)"
    }
    
    score += points
    
    let alert = UIAlertController(title: title, message: "You scored \(points)", preferredStyle: UIAlertControllerStyle.Alert)
    let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in
      self.startNewRound()
    })
    alert.addAction(action)
    
    self.presentViewController(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(sender: UISlider) {
    currentValue = lroundf((sender.value))
  }

  @IBAction func startOver(sender: UIButton) {
    round = 0
    score = 0
    startNewRound()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    startNewRound()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func generateRandomNumber() -> Int {
    return Int(arc4random_uniform(100) + 1)
  }
  
  func startNewRound() {
    // Generate a new target number to find
    targetValue = generateRandomNumber()
    currentValue = 50
    round++
    
    updateLabels()
    
//    bullSlider.value = Float(currentValue)
  }
  
  func updateLabels() {
    bullRandomNumberLabel.text = "\(targetValue)"
    bullScore.text = "\(score)"
    bullRound.text = "\(round)"
  }

}

