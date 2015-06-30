//
//  AnsViewController.swift
//  Finding Factors
//
//  Created by Logan Pratt on 2/22/15.
//  Copyright (c) 2015 Logan Pratt. All rights reserved.
//

import UIKit

class AnsViewController: UIViewController {

    @IBOutlet weak var ansLabel: UITextView!
    var num = 0
    var primes = [Int]()
    var sRoots = [Int]()
    var cRoots = [Int]()
    var factors = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var ansString = "The factors of \(num) are:\n\(factors)\n\nThe square root factors are:\n\(sRoots)\n\nThe cube root factors are:\n\(cRoots)"
        ansLabel.text = ansString

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
