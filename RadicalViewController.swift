//
//  RadicalViewController.swift
//  Finding Factors
//
//  Created by Logan Pratt on 2/20/15.
//  Copyright (c) 2015 Logan Pratt. All rights reserved.
//

import UIKit

class RadicalViewController: UIViewController {
    
    @IBOutlet weak var numField: UITextField!
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func simplify(sender: UIButton) {
        self.view.endEditing(true)
        let num = Int(self.numField.text!)
        
        if (num < 0) {
            let negativeAlert = UIAlertController(title: "Negative Number", message: "Please enter a positive number.", preferredStyle: UIAlertControllerStyle.Alert)
            negativeAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(negativeAlert, animated: true, completion: nil)
        } else {
            ansLabel.text = "Simplified:"
            activityIndicator.startAnimating()
            
            backgroundThread(background: {
                var sRoots = [Int]()
                var firstNum: Int, secondNum: Int
                var ansString = ""
                
                if ((fmod(sqrt(Double(num!)), 1)) == 0) {
                    ansString = "Simplified: \((Int)(sqrt((Double)(num!))))"
                } else {
                    for i in 1...(num!/2) {
                        if ((num! % i) == 0) {
                            if ((fmod(sqrt(Double(i)), 1)) == 0) {
                                sRoots.append(i)
                            }
                        }
                    }
                    firstNum = (Int)(sqrt(Double(sRoots.last!)))
                    if (firstNum == 1) {
                        ansString = "Cannot be simplified"
                    } else {
                        secondNum = num! / sRoots.last!
                        ansString = "Simplified: \(firstNum)√\(secondNum)"
                    }
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.ansLabel.text = ansString
                })
                }, completion: {
                    self.activityIndicator.stopAnimating()
            })
        }
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
