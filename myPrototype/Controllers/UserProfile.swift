//
//  ViewController.swift
//  myPrototype
//
//  Created by Ty rainey on 4/25/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class UserProfile: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var profileSegmentBTn: UISegmentedControl!
    
    var profileArray = ["Name","Race","Gender","Fighting Style"]
    var userArray: [Profile] = []
    var userDef = UserDefaults.standard
    var ref: DatabaseReference!
    var userRef = Database.database().reference().child("key").child("name")
    let userList = ["Nuh","Elf", "Female","Warrior"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = userRef
        getProfileInfomation()
        /*
        userDef.setValue("Ty", forKey: "Name")
        userDef.setValue("Elf", forKey: "Race")
        userDef.setValue("Male", forKey: "Gender")
        userDef.setValue("Swordsman", forKey: "Fighting Style")
        userDef.setValue(4, forKey: "id")
        */
        
        userArray.removeAll()
       // print(userArray)
        //userArray.(userList, forKey: "userArray")
       // userArray.append((userList as? String)!)
      //
        
        
       // myTableView.reloadData()
        
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return profileArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // we will configure the cells here
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
     //   let profiles = userArray[indexPath.section]
       
        
        switch profileSegmentBTn.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = userList[indexPath.section]
        case 1:
            cell.textLabel?.text = "Test 1"
        default:
            break
        }
        
     /*   if userArray.count >= 1 {
        cell.textLabel?.text = userArray[indexPath.section]
        } else {
            cell.textLabel?.text = "No Info"
        }*/
        return cell
        
       
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return profileArray[section]
    }
   
    @IBAction func profileSegmentSection(_ sender: Any) {
    }
    
    @IBAction func logOutBtnPressed(_ sender: Any) {
        
    logout()
        
    }
    
    func logout() {
        
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let err {
            print(err)
        }
        
    }
    
    func getProfileInfomation() {
        ref.observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String:AnyObject] {
                
                let name = dict["name"] as? String
                
                print(name?.description ?? "Error")
                
                
               
                
            }
        }
    }
    
    
}

