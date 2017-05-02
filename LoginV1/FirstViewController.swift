//
//  FirstViewController.swift
//  RoomBooking3
//
//  Created by Magnus Høvik on 18.04.2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit
//import Firebase
import FirebaseAuth

class FirstViewController: UIViewController{ @IBAction func logOut(_ sender: UIButton) {
    
    try! FIRAuth.auth()?.signOut()
    performSegue(withIdentifier: "segue3", sender: self)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(FIRAuth.auth()?.currentUser?.email)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

