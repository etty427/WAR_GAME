//
//  FirebaseService.swift
//  myPrototype
//
//  Created by Ty rainey on 5/20/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import Foundation
import FirebaseDatabase


var ref: DatabaseReference!
var oppVC = OpponentsVC()

struct FirebaseService {


func getPlayers() {
    
    ref = Database.database().reference().child("key").child("players")
    
    //observing the data changes
    ref.observe(DataEventType.value, with: { (snapshot) in
        
        //if the reference have some values
        if snapshot.childrenCount > 0 {
            
            //clearing the list
            oppVC.userList.removeAll()
            
            //iterating through all the values
            for item in snapshot.children.allObjects as! [DataSnapshot] {
                //getting values
                let appObject = item.value as? [String: AnyObject]
                let name  = appObject?["name"] as? String
                let gender  = appObject?["gender"] as? String
                let race = appObject?["race"] as? String
                let fighterType = appObject?["fighterTypeTF"] as? String
                let id = appObject?["id"] as? [String]
                let inventory = appObject?["inventory"] as? String
                //   _ = appObject?["level"] as? Int
           //     let coin = appObject?["coin"] as? Int
             
                //creating artist object with model and fetched values
             //   let list = Profile(name: name!, race: race!, gender: gender!, id: id!, inventory:[inventory!], fighterType: fighterType!, level: 1, coin: 0)
                    //  print(list)
                
             //   oppVC.userList.append(list)
            
               // oppVC.oppTableView.reloadData()
            }
        }
        
    })
    
    }
    
}
