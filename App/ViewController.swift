//
//  ViewController.swift
//  App
//
//  Created by MOZI Development on 9/8/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate {

    
    @IBOutlet weak var submitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitButtonTap(sender: AnyObject) {
        //self.view.endEditing(true)
        self.submitTextField.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    

}

