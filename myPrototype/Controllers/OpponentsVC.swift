//
//  OpponentsVC.swift
//  myPrototype
//
//  Created by Ty rainey on 5/9/18.
//  Copyright © 2018 Ty rainey. All rights reserved.
//
import UIKit
import FirebaseDatabase
import FirebaseAuth

final class OpponentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var userList = [Profile]()
    var invArray = ["sword"]
    var fireService = FirebaseService()
    var handle: AuthStateDidChangeListenerHandle?
    var currentHp = 100
    var currentOppHp = 100
    var currentCoins = 100
    var currentXP = 0
    var currentLevel = 1
    var userName = ""
    var dmgInfo = ""
    var atkInfo = ""
    var coinInfo = ""
    var ref: DatabaseReference!
    var selectedPerson:Profile?

    @IBOutlet weak var lvlLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var hpLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var jobTypeLbl: UILabel!
    @IBOutlet weak var coinLbl: UILabel!
    @IBOutlet weak var oppTableView: UITableView!
    // Timer
    var seconds = 120
    var timer = Timer()
    var isTimeRunning = true
    
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener() { (auth, user) in
            //print(auth)
            if user != nil {
               // self.nameLbl.text = self.userName
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
       ref = Database.database().reference(withPath: "users")
       getPlayers()
        print(ref.childByAutoId())
        ref.observe(.value, with: { (snapshot) in
        
        })
        time()
    }
    
    func time() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
    }
    
    @objc func counter() {
        seconds -= 1
        timerLbl.text = String(seconds)
        if seconds == 0 {
            timer.invalidate()
            currentHp = 100
            currentOppHp = 100
        }
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = oppTableView.dequeueReusableCell(withIdentifier: "opp", for: indexPath) as! OpponentViewCell
        let player: Profile
        player = userList[indexPath.row]

        cell.abilityImg.image = UIImage(named: "active_1")
        cell.oppLvLbl.text = String(currentLevel)
        cell.oppNameBtn.setTitle(player.name, for: .normal)
        cell.armorImg.image = UIImage(named: "shield")
        cell.weaponImg.image = UIImage(named: "sword")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPerson = userList[indexPath.row]
        //performSegue(withIdentifier: "Details", sender: nil)
        let alert = UIAlertController(title: "Ready to Attack!", message: "Do you want to attack \(userName)?", preferredStyle: UIAlertControllerStyle.alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Attack", style: UIAlertActionStyle.default, handler: doSomething))
        alert.addAction(UIAlertAction(title: "Go Back", style: UIAlertActionStyle.cancel, handler: nil))
        present(alert, animated: true, completion: nil)

        if let index = self.oppTableView.indexPathForSelectedRow{
            self.oppTableView.deselectRow(at: index, animated: true)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Cell" {
            let vc = segue.destination as! UserDetail
            vc.nameLabel.text = selectedPerson?.fighter
            vc.levelLabel.text = selectedPerson?.race
        }
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
   
    @objc func doSomething(action: UIAlertAction) {
        attacking()
        let alert = UIAlertController(title: "You won the battle!", message: "You attacked \(userName) for \(dmgInfo)dmg and lost \(atkInfo)hp.  You gained \(coinInfo) gold from the attack.", preferredStyle: UIAlertControllerStyle.alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Attack Again", style: UIAlertActionStyle.default, handler: doSomething))
        alert.addAction(UIAlertAction(title: "Go Back", style: UIAlertActionStyle.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        print("You have attacked")
    }
    public func attacking() {
        let dmg = Int(arc4random_uniform(10))
        let atkDmg = Int(arc4random_uniform(20))
        if currentHp < 15 || currentOppHp < 15{
            let alert = UIAlertController(title: "Unable to attack", message: "Rest up warrior your health is low or the enemy went into hiding from the attacks", preferredStyle: .alert)
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Rest", style: UIAlertActionStyle.cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            print("You can't attack")
        } else {
            let getCoins = Int(arc4random_uniform(30) + 15)
            let getXP = Int(arc4random_uniform(20) + 5)
            let coinsReceived = getCoins + currentCoins
            let xpReceived = getXP + currentXP
            let successAtk = currentOppHp - atkDmg
            let atkDmgTook = currentHp - dmg
            self.dmgInfo = String(atkDmg)
            self.atkInfo = String(dmg)
            self.coinInfo = String(getCoins)
            currentXP = xpReceived
            currentCoins = coinsReceived
            currentOppHp = successAtk
            currentHp = atkDmgTook
            var newHP = currentHp
            var newXP = xpReceived
            var newCoins = coinsReceived
            self.hpLbl.text = ""
            self.coinLbl.text = String(currentCoins)
            self.lvlLbl.text = String(currentLevel)
            print("Enemy HP: \(currentOppHp) My HP:\(newHP)My XP: \(newXP)")
            ref = Database.database().reference().child("users")
            ref.observe(.value) { (snapshop) in
                if snapshop.childrenCount > 0 {
                    for users in snapshop.children.allObjects as! [DataSnapshot] {
                        let childKey = users.key
                        self.ref.child(childKey).updateChildValues(["health" : newHP])
                        self.ref.child(childKey).updateChildValues(["coins" : newCoins])
                        self.ref.child(childKey).updateChildValues(["experiencePoints" : newXP])
                            newHP = self.currentHp
                            newXP = self.currentXP
                            newCoins = self.currentCoins
                         if newXP > 60 {
                            self.ref.child(childKey).updateChildValues(["level" : 3])
                            print("You reached level 3")
                        }
                    }
                }
            }
        }
    }
    func getPlayers() {
        ref = Database.database().reference().child("users")
        //observing the data changes
        ref.observe(DataEventType.value, with: { (snapshot) in
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                //snapshot.ref.removeValue()
                //clearing the list
                self.userList.removeAll()
                //iterating through all the values
                for item in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let appObject = item.value as? [String: AnyObject]
                    let name = appObject?["name"] as! String
                    let gender = appObject?["gender"] as! String
                    let race = appObject?["race"] as! String
                    let fighterType = appObject?["fighterType"] as! String
                    let health = appObject?["health"] as! Int
                    let level = appObject?["level"] as! Int
                    let xp = appObject?["experiencePoints"] as! Int
                    let coin = appObject?["coins"] as! Int
                    self.nameLbl.text = name
                    self.hpLbl.text = String(health)
                    self.coinLbl.text = String(coin)
                    self.jobTypeLbl.text = fighterType
                    self.lvlLbl.text = String(level)
                    self.currentXP = xp
                    self.currentLevel = level
                    let list = Profile(name: name, race: race, gender: gender, fighter: fighterType, health: health)
                    self.userList.append(list)
                    self.oppTableView.reloadData()
                }
            }
        })
    }
}

