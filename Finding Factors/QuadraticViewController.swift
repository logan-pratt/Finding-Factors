//
//  QuadraticViewController.swift
//  Finding Factors
//
//  Created by Logan Pratt on 2/20/15.
//  Copyright (c) 2015 Logan Pratt. All rights reserved.
//

import UIKit

class QuadraticViewController: UIViewController {

    @IBOutlet weak var firstMinus: UILabel!
    @IBOutlet weak var secondMinus: UILabel!
    @IBOutlet weak var thirdMinus: UILabel!
    @IBOutlet weak var firstPlus: UILabel!
    @IBOutlet weak var secondPlus: UILabel!
    @IBOutlet weak var thirdPlus: UILabel!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var factorLabel: UILabel!
    @IBOutlet weak var solutionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func plusMinusChange(minus: UILabel, _ plus: UILabel) {
        minus.hidden = !minus.hidden
        plus.hidden = !plus.hidden
    }
    
    func isAFactor(a: Double, _ b: Double, _ c: Double, _ factor: Double) -> Double {
        return (a*(pow(factor, 2)) + (b*factor) + c)
        
        /*if ((a*(pow(factor, 2)) + (b*factor) + c)==0) {
            return factor
        } else {
            return 9999
        }*/
    }
    
    func posNeg(num: Double, _ plus: UILabel, _ minus: UILabel) -> Double {
        if (plus.hidden) {
            return num * -1
        } else {
            return num
        }
    }
    
    @IBAction func firstPlusChange(sender: UIButton) {
        plusMinusChange(firstMinus, firstPlus)
    }

    @IBAction func secondPlusChange(sender: UIButton) {
        plusMinusChange(secondMinus, secondPlus)
    }
    
    @IBAction func thirdPlusChange(sender: UIButton) {
        plusMinusChange(thirdMinus, thirdPlus)
    }
    
    @IBAction func solveQuadratic(sender: UIButton) {
        self.view.endEditing(true)
        var a = posNeg(Double(firstField.text.toInt()!), firstPlus, firstMinus)
        var b = posNeg(Double(secondField.text.toInt()!), secondPlus, secondMinus)
        var c = posNeg(Double(thirdField.text.toInt()!), thirdPlus, thirdMinus)
        var d = pow(b, 2) + (4*a*c)
        var factor1 = 0.0, factor2 = 0.0
        var factorString = "Factored: ", solutionString = "Solution(s) :"
        
        if (d>=0) {
            factor1 = (-1*b + sqrt(d)) / (2*a)
            factor2 = (-1*b - sqrt(d)) / (2*a)
            factor1 = isAFactor(a, b, c, factor1)
            factor2 = isAFactor(a, b, c, factor2)
            
            if (factor1 != 9999) {
                if (factor1>=0) {
                    factorString = "(x - \(factor1)"
                } else {
                    factorString = "(x + \(factor1)"
                }
            }
            
            if (factor2 != 9999) {
                if (factor2>=0) {
                    factorString = "(x - \(factor2)"
                } else {
                    factorString = "(x + \(factor2)"
                }
            }
            
        }
        
        factorLabel.text = "\(a) \(b) \(c) \(d)\n\(factor1) \(factor2)"
        solutionLabel.text = "Solution(s): x={\(factor1), \(factor2))"
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //Dissmisses keyboard if touched outside
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
