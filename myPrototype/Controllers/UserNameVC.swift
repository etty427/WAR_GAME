//
//  UserNameVC.swift
//  myPrototype
//
//  Created by Ty rainey on 5/20/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit

class UserNameVC: UIViewController, UITextFieldDelegate {
    
    var userName = ""
    var level = 1
    var coin = 0
    
    @IBOutlet weak var userNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let createVC = segue.destination as! CreateProfileVC
        createVC.userName = userNameTF.text!
    }
    @IBAction func addUserNameBtnPressed(_ sender: UIButton) {
        
        if userNameTF.text != "" {
            performSegue(withIdentifier: "create", sender: nil)
            userName = userNameTF.text!
        }
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTF.resignFirstResponder()
        
        return true
    }
    
}
