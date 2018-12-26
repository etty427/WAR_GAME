//
//  CreateProfileVC.swift
//  myPrototype
//
//  Created by Ty rainey on 5/20/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class CreateProfileVC: UIViewController, UITextFieldDelegate {
    
    var userRef: DatabaseReference!
    var playerInventory = [Inventory]()
    var userName = ""
    let delegate = UIApplication.shared.delegate as! AppDelegate
  
    @IBOutlet weak var fighterTypeTF: UITextField!
    @IBOutlet weak var raceTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Username: ", userName)
        userRef = Database.database().reference()
    }
    func addPlayers() {
        let health = 100
        let coins = 0
        let level = 1
        let xp = 0
        let questPts = 10
        let key = userRef.childByAutoId().key
        let players = ["name":userName,"id":key,"fighterType":fighterTypeTF.text!,"health":health,"gender":genderTF.text!,"race":raceTF.text ?? "no race","coins": coins, "level": level, "experiencePoints": xp, "questPoints": questPts] as [String : Any]
        userRef.child("users").child(key).setValue(players)
        print("Player added")
    }
    @IBAction func addPlayerBtnPressed(_ sender: UIButton) {
        addPlayers()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
