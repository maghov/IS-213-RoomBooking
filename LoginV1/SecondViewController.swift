//
//  SecondViewController.swift
//  RoomBooking3
//
//  Created by Magnus Høvik on 18.04.2017.
//  Copyright © 2017 Magnus Høvik. All rights reserved.
//

import UIKit
import Firebase

var roomList = [RoomModel]()
var refRooms: FIRDatabaseReference!
var myIndex = Int()

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var textFieldSpace: UITextField!

    @IBOutlet weak var textFieldName: UITextField!
  
    @IBOutlet weak var textFieldDetails: UITextField!
    
    @IBOutlet weak var tblRooms: UITableView!

    @IBAction func buttonAddRoom(_ sender: UIButton) {
        addRoom()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        myIndex = indexPath.row
        print("IndexPath ", indexPath.row)
        performSegue(withIdentifier: "segue", sender: self)
        
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!ViewControllerTableViewCell
        
        let room: RoomModel
        
        room = roomList[indexPath.row]
        
        cell.lblName.text = room.name
        cell.lblSpace.text = "Antall plasser " + room.space!
        cell.lblDetails.text = room.details

        
        return cell
    }
    
    func addRoom() {
        let key = refRooms.childByAutoId().key
    
        let room = ["id": key,
                        "name": textFieldName.text! as String,
                        "space": textFieldSpace.text! as String,
                        "details": textFieldDetails.text! as String
                        ]
    
    refRooms.child(key).setValue(room)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        refRooms = FIRDatabase.database().reference().child("list")
        
        refRooms.observe(FIRDataEventType.value, with:{(snapshot) in
        
            if snapshot.childrenCount > 0 {
                roomList.removeAll()
                
                for rooms in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    let roomObject = rooms.value as? [String: AnyObject]
                    let name = roomObject?["name"]
                    let space = roomObject?["space"]
                    let id = roomObject?["id"]
                    let details = roomObject? ["details"]
                    
                    
                    let room = RoomModel(id: id as! String?, name: name as! String?, space: space as! String?, details: details as! String?)
                    roomList.append(room)
                    
                    
                }
            }
        
            self.tblRooms.reloadData()
            
        })
        
 
        }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

