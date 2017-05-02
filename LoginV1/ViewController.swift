//
//  ViewController.swift
//  LoginV1
//
//  Created by Eirik Oliversen on 21.04.2017.
//  Copyright © 2017 eoliversen. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    
    @IBAction func action(_ sender: UIButton) {
        if emailText.text != "" && passwordText.text != ""
        {
            if segmentController.selectedSegmentIndex == 0 //Login user
                
                
            {
                FIRAuth.auth()?.signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil
                    {
                        //sign in successful-Send user to viewcontroller2
                        self.performSegue(withIdentifier: "segue1", sender: self)
                        
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR!")
                        }
                        
                    }
                })
            }
            else //sign up user
                
            {
                
                FIRAuth.auth()?.createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil
                        
                        
                    {
                        //Send user to viewcontroller2
                        self.performSegue(withIdentifier: "segue1", sender: self)
                    }
                        
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR!")
                        }
                        
                    }
                })
            }
        }
    }

    @IBAction func segmentControllerView(_ sender: UISegmentedControl) {
        if segmentController.selectedSegmentIndex == 0 {
        Login.setTitle("Login", for: .normal)
        }
        else {
        Login.setTitle("Sign up", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

