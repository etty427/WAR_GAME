//
//  MoneyComponent.swift
//  myPrototype
//
//  Created by Ty rainey on 5/15/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import SpriteKit
import GameplayKit

class MoneyComponent: GKComponent {
    
    // 1
    var coins = 0
    var lastCoinDrop = TimeInterval(0)
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 2
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        // 3
        let coinDropInterval = TimeInterval(0.5)
        let coinsPerInterval = 10
        if (CACurrentMediaTime() - lastCoinDrop > coinDropInterval) {
            lastCoinDrop = CACurrentMediaTime()
            coins += coinsPerInterval
        }
    }
}
