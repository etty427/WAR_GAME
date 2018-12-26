//
//  SplashVC.swift
//  myPrototype
//
//  Created by Ty rainey on 7/9/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//

import UIKit

final class SplashVC: UIViewController {
    
    let defaults = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        if defaults.bool(forKey: "loggedIn") {
            performSegue(withIdentifier: "Main", sender: nil)
        }
        else {
            performSegue(withIdentifier: "Login", sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
