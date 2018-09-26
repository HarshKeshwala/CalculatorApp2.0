//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Harsh Keshwala on 2018-09-21.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultTextview: UITextField!
    var hasDecimal:Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func numbersButton(_ sender: UIButton)
    {
        if(resultTextview.text == "0") {
            
            if(sender.tag != -1) {
                resultTextview.text = ""
                
            }
            else {
                if(hasDecimal) {
                    resultTextview.text = "0"
                }
            }
            
        }
        
        if(sender.tag == -1) {
            if(!hasDecimal) {
                resultTextview.text?.append(".")
                hasDecimal = true
            }
        }
        else {
            resultTextview.text?.append(String(sender.tag))
        }
    }
    
}

