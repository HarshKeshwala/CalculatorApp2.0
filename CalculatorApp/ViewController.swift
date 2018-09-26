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
    
    @IBAction func operatorsButton(_ sender: UIButton)
    {
        if (operationFlag != 0)
        {
            operationFlag = 0
        }
        if(sender.tag == 16)
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
        else if(sender.tag == 15)
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
        else if(sender.tag == 14)
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
        else if(sender.tag == 18)
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
        else if(sender.tag == 13)
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
    
    @IBAction func equalsOperation(_ sender: UIButton)
    {
        var result:String = ""
        var r:Double = Double(result)!
        
        let isInteger = floor(r) == r
        
        if(isInteger == true)
        {
                resultTextview.text = String(Int64(r))
        }
        
        switch operationFlag
        {
        case 1:
            let temp1:String = resultTextview.text!
            currentNumber = previousNumber + Double(temp1)!
            resultTextview.text = String(currentNumber)
            //result = String(currentNumber)
            previousNumber = 0
        case 2:
            let temp2:String = resultTextview.text!
            currentNumber = previousNumber - Double(temp2)!
            resultTextview.text = String(currentNumber)
            previousNumber = 0
        case 3:
            let temp3:String = resultTextview.text!
            currentNumber = (previousNumber * (Double(temp3))!)
            resultTextview.text = String(currentNumber)
            previousNumber = 0
        case 4:
            let temp4:String = resultTextview.text!
            if(temp4 == "0")
            {
                resultTextview.text = "Error"
            }
            else
            {
                currentNumber = (previousNumber / (Double(temp4))!)
                resultTextview.text = String(currentNumber)
                previousNumber = 0
            }
        default:
            previousNumber = 0
        }
        operationFlag = 0;
    }
    
    @IBAction func resetOperation(_ sender: UIButton)
    {
        hasDecimal = false;
        currentNumber = 0;
        previousNumber = 0;
        operationFlag = 0;
        resultTextview.text = "0"
    }
    
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

