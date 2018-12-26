//
//  UserDetail.swift
//  myPrototype
//
//  Created by Ty rainey on 7/8/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit
import FirebaseDatabase

final class UserDetail: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    let person = OpponentsVC()
    var firRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person.userName
        levelLabel.text = String(person.currentLevel)
        getUserData()
        firRef.database.reference().child("users")
        
    }
    func getUserData() {
        firRef = Database.database().reference().child("users")
        firRef.observe(.value) { (snapshot) in
            for users in snapshot.children.allObjects as! [DataSnapshot] {
                print(users)
            }
        }
        
    }
}
