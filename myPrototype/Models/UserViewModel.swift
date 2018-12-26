//
//  UserViewModel.swift
//  myPrototype
//
//  Created by Ty rainey on 6/9/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import Foundation

class UserViewModel {
    
    var reloadUsers = {() -> () in }
    
    var arrayOfUsers: [Profile] = [] {
        didSet {
            reloadUsers()
        }
    }
    
 //   func addNewUser(name:String?,race:String?,gender:String?,id:[String]?,inventory:[String]?,fightType:String?,level:Int?,coin:Int?) {
     //   arrayOfUsers.append(Profile(name: name!, race: race!, gender: gender!, id: id!, inventory: inventory!, fighterType: fightType!, level: level!, coin: coin!))
    //}
}
