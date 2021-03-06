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
    @IBOutlet weak var solveButton: UIButton!
    
    var textFields: Array<UITextField>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        textFields = [firstField, secondField, thirdField]
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
        
        if allFieldsFull() {
            let a = posNeg(Double(Int(firstField.text!)!), firstPlus, firstMinus)
            let b = posNeg(Double(Int(secondField.text!)!), secondPlus, secondMinus)
            let c = posNeg(Double(Int(thirdField.text!)!), thirdPlus, thirdMinus)
            let d = b*b - (4*a*c)
            var factor1 = 0.0, factor2 = 0.0
            var factorString = "Factored: ", solutionString = "Solutions: x = {"
            
            if (d>=0) {
                factor1 = ((-b + sqrt(d)) / (2*a)).roundToPlaces(3)
                factor2 = ((-b - sqrt(d)) / (2*a)).roundToPlaces(3)
                
                
                if (factor1>=0) {
                    factorString += "(x - \(factor1.noZeros()))"
                } else {
                    factorString += "(x + \((factor1 * -1).noZeros()))"
                }
                
                
                if (factor2>=0) {
                    factorString += " (x - \(factor2.noZeros()))"
                } else {
                    factorString += " (x + \((factor2 * -1).noZeros()))"
                }
                
                solutionString += "\(factor1.noZeros()), \(factor2.noZeros())}"
            } else {
                factorString=""
                solutionString = "Solution: x = (\((-b).noZeros()) ± i√(\((-d).noZeros()))) / \((2*a).noZeros())"
            }
            
            factorLabel.text = factorString
            solutionLabel.text = solutionString
        } else {
            factorLabel.text = "Factored: "
            solutionLabel.text = "Solutions: x = {"
        }
    }
    
    func allFieldsFull() -> Bool {
        for textField in textFields {
            textField.resignFirstResponder()
            if textField.text?.characters.count == 0 {
                return false
            }
        }
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
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

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
    
    func noZeros() -> String {
        return String(format:"%g", self)
    }
}