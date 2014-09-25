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

  @IBOutlet weak var bullSlider: UISlider!
  
  @IBAction func showAlert(sender: UIButton) {
    let alert = UIAlertController(title: "\(currentValue)", message: "The value of the slider is: \(currentValue)", preferredStyle: UIAlertControllerStyle.Alert)
    let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
    alert.addAction(action)
        
    self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
      currentValue = lroundf((sender.value))
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      currentValue = lroundf(bullSlider.value)
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

}

