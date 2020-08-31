//
//  balanceViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 26/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import UIKit
import SQLite

class balanceViewController: mainViewController {
    var balanceUserID = 0
    //var dataID = 0
    
    func updateBalance(x: Double){
        balanceTextField.text = "Current Balance: €\(x)" 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            for user in try db.prepare(user1){
                updateBalance(x: user[balance])
            }
            
        } catch {
            print("error in main")
        }
        
    }
    
    @IBOutlet weak var balanceTextField: UILabel!
    
    @IBAction func fiveButton(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == balanceUserID {
                    try db.run(user1.update(balance <- balance + 5))
                    updateBalance(x: user[balance])
                }
            }
        } catch {
            print("error in main")
        }
    }
    @IBAction func tenButton(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == balanceUserID {
                    try db.run(user1.update(balance <- balance + 10))
                    updateBalance(x: user[balance])
                }
            }
        } catch {
            print("error in main")
        }
    }
    @IBAction func twentyFiveButton(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == balanceUserID {
                    try db.run(user1.update(balance <- balance + 25))
                    updateBalance(x: user[balance])
                }
            }
        } catch {
            print("error in main")
        }
    }
    @IBAction func fiftyButton(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == balanceUserID {
                    try db.run(user1.update(balance <- balance + 50))
                    updateBalance(x: user[balance])
                }
            }
        } catch {
            print("error in main")
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//               let data  = segue.destination as! dataViewController
//               data.dataUserID = balanceUserID
//    }
}
