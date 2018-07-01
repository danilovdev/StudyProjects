//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alexey Danilov on 26.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    private var calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func commandButtonTapped(_ sender: UIButton) {
        if let text = display.text, let num = Double(text) {
            var clearDisplay = true
            switch sender.tag {
            case 0:
                calculator.commandEntered(newNumber: num, nextCommand: nil)
                display.text = "\(calculator.currentValue)"
                clearDisplay = false
            case 1:
                calculator.commandEntered(newNumber: num, nextCommand: AddCommand())
            case 2:
                calculator.commandEntered(newNumber: num, nextCommand: SubCommand())
            case 3:
                calculator.commandEntered(newNumber: num, nextCommand: MultiplyCommand())
            case 4:
                calculator.commandEntered(newNumber: num, nextCommand: DivideCommand())
            case 5:
                calculator.clear()
            default:
                break
            }
            if clearDisplay {
                display.text = "0"
            }
        }
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        display.text = sender.titleLabel?.text
    }
    
    


}

