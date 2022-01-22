//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(resultLabel.text!) else {
                fatalError("Cannot convert label to Double")
            }
            return number
        }
        
        set {
            resultLabel.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        

        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayValue = 0
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
    }
 
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                resultLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    if !(floor(displayValue) == displayValue) {
                        return
                    }
                }
 
                resultLabel.text = resultLabel.text! + numValue
            }
        }
    }
}

