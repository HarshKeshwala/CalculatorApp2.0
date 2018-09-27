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
    
    var currentNumber:Double = 0;
    var previousNumber:Double = 0;
    
    var operationFlag:Int = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // function to perform numbers and other exceptions
    @IBAction func numbersButton(_ sender: UIButton)
    {
        if(resultTextview.text == "Error")
        {
            resultTextview.text = ""
        }
        
        if(resultTextview.text == "+" || resultTextview.text == "-" || resultTextview.text == "x" || resultTextview.text == "÷")
        {
            resultTextview.text = ""
        }

        
        if(resultTextview.text == "0")
        {
            if(sender.tag != -1)
            {
                resultTextview.text = ""
            }
            else
            {
                if(hasDecimal)
                {
                    resultTextview.text = "0"
                }
            }
        }
        if(sender.tag == -1)
        {
            if(!hasDecimal)
            {
                resultTextview.text?.append(".")
                hasDecimal = true
            }
        }
        else
        {
            resultTextview.text?.append(String(sender.tag))
        }
    }
    
    // function to fetch flags and operators
    @IBAction func operatorsButton(_ sender: UIButton)
    {
        hasDecimal = false
        
       if (operationFlag != 0)
        {
            operationFlag = 0
        }
      
        if(sender.tag == 16) //addition opertion
        {
            operationFlag = 1;
            if(previousNumber == 0)
            {
                let temp16:String = resultTextview.text!
                previousNumber = Double(temp16)!
                
            }
            currentNumber = 0;
            resultTextview.text = "+"
        }
        else if(sender.tag == 15)// substraction operation
        {
            operationFlag = 2;
            if(previousNumber == 0)
            {
                let temp15:String = resultTextview.text!
                previousNumber = Double(temp15)!
                
            }
            currentNumber = 0;
            resultTextview.text = "-"
            
        }
        else if(sender.tag == 14)// Multiplicatio operation
        {
            operationFlag = 3
            if(previousNumber == 0)
            {
                let temp14:String = resultTextview.text!
                previousNumber = Double(temp14)!
                
            }
            currentNumber = 0
            resultTextview.text = "x"
        }
        else if(sender.tag == 18)// Division operation
        {
            operationFlag = 4
            if(previousNumber == 0)
            {
                let temp18:String = resultTextview.text!
                previousNumber = Double(temp18)!
                
            }
            currentNumber = 0
            resultTextview.text = "÷"
        }
        else if(sender.tag == 13)// Percentage operation
        {
            operationFlag = 5
            if(previousNumber == 0)
            {
                let temp13:String = resultTextview.text!
                previousNumber = Double(temp13)!
               
            }
            currentNumber = (previousNumber/100)
            resultTextview.text = String(currentNumber)
        }
    }
    
    // function to evaluate different operations
    @IBAction func equalsOperation(_ sender: UIButton)
    {
       
        var result:String = "";
        func printResult(result: String)
        {
            let r:Double = Double(result)!
            
            let isInteger = floor(r) == r
            
            if(isInteger == true)
            {
                resultTextview.text = String(Int64(r))
            }
            else
            {
                resultTextview.text = String(r)
            }
        }
        
        // disables the equal button if any operator is selected
        if operationFlag == 0
        {
            let button = UIButton(type: UIButtonType.system) as UIButton
            button.isEnabled = false
        }
        else
        {
                switch operationFlag
                {
                    case 1: // addition operation
                        let temp1:String = resultTextview.text!
                        currentNumber = previousNumber + Double(temp1)!
                        result = String(currentNumber)
                        printResult(result: result)
                        previousNumber = 0
                    case 2: // substraction operation
                        let temp2:String = resultTextview.text!
                        currentNumber = previousNumber - Double(temp2)!
                       result = String(currentNumber)
                      printResult(result: result)
                        previousNumber = 0
                    case 3: // multiplication operation
                        let temp3:String = resultTextview.text!
                        currentNumber = (previousNumber * (Double(temp3))!)
                        result = String(currentNumber)
                        printResult(result: result)
                        previousNumber = 0
                    case 4: // division operation
                        let temp4:String = resultTextview.text!
                       
                        if(temp4 == "0")
                        {
                            resultTextview.text = "Error"
                        }
                        else
                        {
                            currentNumber = (previousNumber / (Double(temp4))!)
                            result = String(currentNumber)
                            printResult(result: result)
                            previousNumber = 0
                        }
                    default:
                        previousNumber = 0
                    }
        }
        operationFlag = 0;
    }
    
    // function to perform reset operation
    @IBAction func resetOperation(_ sender: UIButton)
    {
        hasDecimal = false;
        currentNumber = 0;
        previousNumber = 0;
        operationFlag = 0;
        resultTextview.text = "0"
    }
    
    // function to perform plus and minus operation
    @IBAction func plusMinusOperation(_ sender: UIButton)
    {
        var temp:Double = Double(resultTextview.text!)!
        if(temp != 0)
        {
            temp *= (-1)
            resultTextview.text = String(temp)
        }
    }
}

