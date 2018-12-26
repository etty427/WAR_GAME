//
//  ShopViewCell.swift
//  myPrototype
//
//  Created by Ty rainey on 5/10/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit

class ShopViewCell: UITableViewCell {
    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    
    var shop = ShopVC()
    var defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buyBtnPressed(_ sender: Any) {
      
        print("My Coin: \(shop.coins - 1500)")
        defaults.set(shop.coins - 1500, forKey: "coins")
        
    }
    
    @IBAction func sellBtnPressed(_ sender: Any) {
    }
}
