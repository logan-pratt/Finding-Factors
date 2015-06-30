//
//  FactorViewController.swift
//  Finding Factors
//
//  Created by Logan Pratt on 2/20/15.
//  Copyright (c) 2015 Logan Pratt. All rights reserved.
//

import UIKit

extension Int {
    var isPrime:Bool{
        if self <  2 { return false }
        let squareRoot = Int(sqrt(Double(self)))
        if squareRoot * squareRoot == self { return false }
        for i in 2..<Int(ceil(sqrt(Double(self)))) {
            if self % i == 0 { return false }
        }
        return true
    }
}

class FactorViewController: UIViewController {

    @IBOutlet weak var numField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func findFactors(sender: UIButton) {
        let num = numField.text.toInt()
        var numPrime = true
        var errorAlert = UIAlertController(title: "Error", message: "The number that you entered is either too big and will take too long to factor or is not a number.", preferredStyle: UIAlertControllerStyle.Alert)
        errorAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        var primes = [Int]()
        var sRoots = [Int]()
        var cRoots = [Int]()
        var factors = [Int]()
        
        for i in 2...(num!/2) {
            if ((num! % i) == 0) {
                numPrime = false;
                factors.append(i)
                var isPrimeFactor = true
                
                /*for l in 2..<Int(ceil(sqrt(Double(i)))) {
                    if ((i%l) == 0) {
                        isPrimeFactor = false;
                    }//end if
                }//end for*/
                
                if (i.isPrime) {
                    primes.append(i)
                }//end if
                
                if ((fmod(sqrt(Double(i)), 1)) == 0) {
                    sRoots.append(i)
                }//end if
                
                if ((fmod(cbrt(Double(i)), 1)) == 0) {
                    cRoots.append(i)
                }//end if
            }//end if
        }//end for
        if (numPrime == true) {
            if (num! == 0) {
                var zeroAlert = UIAlertController(title: "Zero", message: "The number 0 has no factors.", preferredStyle: UIAlertControllerStyle.Alert)
                zeroAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(zeroAlert, animated: true, completion: nil)
            } else {
                var primeAlert = UIAlertController(title: "Prime Number", message: "\(num!) is a prime number, it has no factors except 1 and \(num!).", preferredStyle: UIAlertControllerStyle.Alert)
                primeAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(primeAlert, animated: true, completion: nil)
            }//end if
        } else {
            //Checks if num is an Int or is too big
            if (num != nil) {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let ansViewController = storyBoard.instantiateViewControllerWithIdentifier("ansView") as! AnsViewController
                //Transfers variables to ansViewController
                ansViewController.num = Int(num!)
                ansViewController.factors = factors
                ansViewController.primes = primes
                ansViewController.sRoots = sRoots
                ansViewController.cRoots = cRoots
                //Switches to ansViewController
                self.presentViewController(ansViewController, animated:true, completion:nil)
            } else {
                //Displays errorAlert
                self.presentViewController(errorAlert, animated: true, completion: nil)
            }//end notNum check
        }//end primeNum check
    }//end findFactors
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //Dissmisses keyboard if touched outside
        self.view.endEditing(true)
    }
    
    @IBAction func unwindToFactors(segue: UIStoryboardSegue) {
        
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
