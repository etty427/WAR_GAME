//
//  Profile.swift
//  myPrototype
//
//  Created by Ty rainey on 4/26/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//
import UIKit
import Firebase

class Profile {
    var name:String!
    var race:String!
    var gender:String!
    var fighter: String!
    var health:Int!
    
    init(name:String,race:String,gender:String,fighter:String,health:Int) {
        self.name = name
        self.race = race
        self.gender = gender
        self.fighter = fighter
        self.health = health
    }
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
        
            let name = dict["name"] as? String,
            let race = dict["race"] as? String,
            let gender = dict["gender"] as? String,
            let fighter = dict["fighterType"] as? String,
            let health = dict["health"] as? Int
 
            else { return nil }
        self.name = name
        self.race = race
        self.gender = gender
        self.fighter = fighter
        self.health = health
        
    }
}

enum FighterType {
    
    case warrior
    case wizard
    case ninja
}

class Warrior:Profile {
    func whirlwind() {
        print("Damage x3")
    }
}
class Ninja:Profile {
    
}
class Wizard:Profile {
    
}
