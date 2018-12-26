//
//  LoginVC.swift
//  myPrototype
//
//  Created by Ty rainey on 5/21/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit
import FirebaseAuth

final class LoginVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        if defaults.bool(forKey: "loggedIn") {
            performSegue(withIdentifier: "main", sender: nil)
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if emailTF.text != "" && passwordTF.text != "" {
            Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else if let user = user {
                    print(user)
                    self.defaults.set(true, forKey: "loggedIn")
                    self.performSegue(withIdentifier: "login", sender: nil)
                }
            }
            print("cant go any further")
        }
    }
    @IBAction func registerBtnPressed(_ sender: Any) {
        if emailTF.text != "" && passwordTF.text != "" {
            Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
                if let error = error {
                    print("Error:\(error.localizedDescription)")
                }
                else if let user = user {
                    print(user)
                    self.performSegue(withIdentifier: "create", sender: nil)
                }
            }
            
        }
    }
}
