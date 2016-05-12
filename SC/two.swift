//
//  ViewController.swift
//  SC
//
//  Created by YZQ on 16/5/5.
//  Copyright © 2016年 YZQ. All rights reserved.
//

import UIKit

class two: UIViewController {
   
    
    @IBOutlet weak var TEAMICE: UITextField!
    @IBOutlet weak var TEAMFIRE: UITextField!
    var FIREgrade:String = ""
    var ICEgrade:String = ""
    var operand1:String = ""
    var operand2:String = ""
    var grade1 = 0
    var grade2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AC(sender: UIButton) {
        let value = sender.currentTitle!
        if value == "清空分数" {
            FIREgrade = ""
            ICEgrade = ""
            TEAMFIRE.text = ""
            TEAMICE.text = ""
            grade1 = 0
            grade2 = 0
            return
        }

    }
       @IBAction func ADD(sender: UIButton) {
        let value = sender.currentTitle!
        
        if value == "FIRE1"||value == "FIRE2"||value == "FIRE3" {
            
            operand1 = value
            switch operand1 {
                case "FIRE1":
                    grade1 = grade1 + 1
                    TEAMFIRE.text = "\(grade1)"
                case "FIRE2":
                    grade1 = grade1 + 2
                    TEAMFIRE.text = "\(grade1)"
                case "FIRE3":
                    grade1 = grade1 + 3
                    TEAMFIRE.text = "\(grade1)"
                default:
                    grade1 = 0
                
            }
        }
        
        else if value == "ICE1"||value == "ICE2"||value == "ICE3" {
            
            operand2 = value
            switch operand2 {
            case "ICE1":
                grade2 = grade2 + 1
                TEAMICE.text = "\(grade2)"
            case "ICEd2":
                grade2 = grade2 + 2
                TEAMICE.text = "\(grade2)"
            case "ICE3":
                grade2 = grade2 + 3
                TEAMICE.text = "\(grade2)"
            default:
                grade2 = 0
                
            }
        }

       
    }
    
    
}

