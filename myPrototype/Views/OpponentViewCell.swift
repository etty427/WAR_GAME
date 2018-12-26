//
//  OpponentViewCell.swift
//  myPrototype
//
//  Created by Ty rainey on 5/10/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit

class OpponentViewCell: UITableViewCell {
    
 
    @IBOutlet weak var oppNameBtn: UIButton!
    @IBOutlet weak var oppLvLbl: UILabel!
    @IBOutlet weak var atkNtn: UIButton!
    @IBOutlet weak var weaponImg: UIImageView!
    @IBOutlet weak var armorImg: UIImageView!
    @IBOutlet weak var abilityImg: UIImageView!
    
    var base = OpponentsVC()
    var yourobj : (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @objc func attack(sender: UIButton){
        let buttonTag = sender.tag
        if buttonTag == 2 {
            base.attacking()
        }
    }

    @IBAction func atkButtonPressed(_ sender: UIButton) {
        print("Attack button doesn't work")
        atkNtn.addTarget(self, action: #selector(attack(sender:)), for: .touchUpInside)
    }
    
    @IBAction func nameBtnPressed(_ sender: Any) {
        print("Name of user")

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? OpponentViewCell
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell!.yourobj =
            {
                //Do whatever you want to do when the button is tapped here
                self.base.attacking()
        }
        
        return cell!
        
    }
}
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController?
            }
        }
        return nil
    }
}
