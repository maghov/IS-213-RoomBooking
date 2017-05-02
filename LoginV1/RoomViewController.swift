//
//  RoomViewController.swift
//  RoomBooking3
//
//  Created by Mohammad Hussain on 21/04/2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit
import Firebase



class RoomViewController: UIViewController {

    @IBOutlet weak var dLabel: UILabel!

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var bLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        dLabel.text = "Romnummer " + roomList[myIndex].name!
        
        bLabel.text = "Antall plasser " + roomList[myIndex].space!

        
        navigationBar.topItem?.title = roomList[myIndex].name
        
    
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
