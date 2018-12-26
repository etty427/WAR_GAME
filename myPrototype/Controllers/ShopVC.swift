//
//  ShopVC.swift
//  myPrototype
//
//  Created by Ty rainey on 5/10/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit

class ShopVC: UIViewController {
    
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    
    var coins = 200000
    // weapon images
    let weapons = ["sword_1","sword_2","sword_3","sword","sword2","woodSword","axe","axe2","axeDouble","axeDouble2","bow","bow2","dagger","dagger2","hammer","hammer2","wand","wand2"]
    // waepon names
    let swords = ["Broad Sword","Flame Sword","Ultimate Sword","Steele Sword","Gold Sword", "Wood Sword","Axe","Mitril Axe","Hercules Axe","Ebony Axe","Bronze Bow","Icurus Bow","Bronze Dagger","Thief Dagger","Thor Hammer","Zeus Hammer","Merlin's Wand","Ebnazier's Wand"]
    // armor images
    let armor = ["armor","armor 2","helmet","helmet2","leather","leather2","shield_semi","shield_wood","shield","shield2","shieldSmall","shieldSmall2","Armor_1","Armor_2","Armor_3","Armor_4","Armor_5","Armor_6","Armor_7","Armor_8","Armor_10"]
    // armor names
    let armorName = ["Basic Armor","Sheep Armor","Basic Helmet","helmet2","leather","leather2","shield_semi","shield_wood","shield","shield2","shieldSmall","shieldSmall2","Armor_1","Armor_2","Armor_3","Armor_4","Armor_5","Armor_6","Armor_7","Armor_8","Armor_10"]
    
    @IBAction func shopSegment(_ sender: Any) {
        
        shopTableView.reloadData()
        
    }
    
    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var shopSegBtn: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

}

extension ShopVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shop", for: indexPath) as! ShopViewCell
        
        switch shopSegBtn.selectedSegmentIndex {
        case 0:
           // if shopSegBtn.s
            cell.itemLbl.text = swords[indexPath.row]
            cell.shopImage.image = UIImage(named: weapons[indexPath.row])
        case 1:
            cell.itemLbl.text = armorName[indexPath.row]
            cell.shopImage.image = UIImage(named: armor[indexPath.row])
        case 2:
            cell.itemLbl.text = "Super Jump"
            cell.shopImage.image = UIImage(named: "active_1")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
