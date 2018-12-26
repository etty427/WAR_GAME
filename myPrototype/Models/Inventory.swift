//
//  Inventory.swift
//  myPrototype
//
//  Created by Ty rainey on 5/22/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import Foundation

struct Inventory {
    
    var weapons = [String]()
    var armor = [String]()
    var specials = [String]()
    
    init(weapons:[String], armor:[String], specials:[String]) {
        self.weapons = weapons
        self.armor = armor
        self.specials = specials
    }
}
