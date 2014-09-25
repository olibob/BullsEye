//
//  ViewController.swift
//  BullsEye
//
//  Created by Olivier Robert on 25/9/14.
//  Copyright (c) 2014 Olibob Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func showAlert(sender: UIButton) {
        let alert = UIAlertController(title: "Hello, World!", message: "This is my alert message", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

