//
//  ViewController.swift
//  tips
//
//  Created by Joseph Ku on 12/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercentages = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // initialize the percentages array from the labels of the segmented control
        
        for var i = 0; i < tipControl.numberOfSegments; i++ {
            var title: String! = tipControl.titleForSegmentAtIndex(i)
            // drop the percentage sign, convert to decimal
            tipPercentages.append(dropLast(title)._bridgeToObjectiveC().doubleValue / 100.0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        println("User editing bill")
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
