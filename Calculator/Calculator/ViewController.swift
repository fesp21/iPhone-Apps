//
//  ViewController.swift
//  Calculator
//
//  Created by Sandeep on 9/18/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    var plus : Bool = false
    var minus : Bool = false
    var multiply : Bool = false
    var divide : Bool = false
    var storedInt : Int = 0
    var storedInt2 : Int = 0
    var answer : Int = 0
    

     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func substracting(#num:Int , num2:Int )->(Int)
    {
        return num - num2
    }
    func adding(#num:Int , num2:Int )->(Int)
    {
        return num + num2
    }
    func multiply(#num:Int , num2:Int )->(Int)
    {
        println(num * num2)
        return num * num2
    }
    func divide(#num:Int , num2:Int )->(Int)
    {
        return num / num2
    }
    
    
    
    
    @IBOutlet weak var Text: UILabel!
    
    
  
    @IBAction func DigitPressed(sender: UIButton)
    {
        if Text.text == "0"
        {
            Text.text = (sender.titleLabel?.text)!
        }else{
        Text.text = (Text.text)! + (sender.titleLabel?.text)!
        }
        println(sender.titleLabel?.text!)
    }
    
    
    @IBAction func clearPressed(sender: AnyObject)
    {
        Text.text = "0"
    /*
        var array = [Character]()
        
        for character in Text.text!
        {
            array.append(character)
            println(character)
        }
        println(array)
        Text.text = ""
        var number = 0
        var numb = array.count
        if (numb > 2)
        {
             number = numb - 2
        }else{
            number = numb
        }
        
        if (number > 0 && !array.isEmpty)
        {
        for num in 0...number
        {
            Text.text = (Text.text)! + (String((array[num])))
        }
        }  */
    }
    
    
    
    @IBAction func enterPressed(sender: AnyObject)
    {
        println("Enter")
        storedInt2 = (Text.text?.toInt())!
        
        if minus
        {
            answer = substracting(num: storedInt, num2: storedInt2)
            Text.text = String(answer)
            minus = false
        }
        if plus
        {
            answer = adding(num: storedInt, num2: storedInt2)
            Text.text = String(answer)
            plus = false
        }
        if multiply
        {
            answer = storedInt2 * storedInt
                //multiply(num: storedInt, num2: storedInt2)
            println(multiply(num: storedInt, num2: storedInt2))
            Text.text = String(answer)
            multiply = false
        }
        if divide
        {
            answer = divide(num: storedInt, num2: storedInt2)
            Text.text = String(answer)
            multiply = false
        }
        
    }
  
    
    
    @IBAction func minusSign(sender: AnyObject)
    {
        storedInt = (Text.text?.toInt())!
        Text.text  = "0"
        minus = true
        plus = false
    }
    

    @IBAction func plusSign(sender: AnyObject)
    {
        println("Plus")
        storedInt = (Text.text?.toInt())!
        Text.text  = "0"
        plus = true
    }
    
    
    @IBAction func Multiply(sender: AnyObject)
    {
        println("*")
        storedInt = (Text.text?.toInt())!
        Text.text  = "0"
        multiply = true
        minus = false
        
    }
    
    @IBAction func Divide(sender: AnyObject)
    {
        println("/")
        storedInt = (Text.text?.toInt())!
        Text.text  = "0"
        divide = true
    }
    
}
















