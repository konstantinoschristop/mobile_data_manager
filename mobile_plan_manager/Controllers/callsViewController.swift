//
//  callsViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 29/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import UIKit
import SQLite

class callsViewController: mainViewController {
    var callsUserID = 0
    
    @IBOutlet weak var callsTextField: UILabel!
    @IBOutlet weak var balanceTextField: UILabel!
    
    func updateCalls(x: Int){
        callsTextField.text = "Your available calls: \(x)'"
    }
    func updateBalance(x: Double){
        balanceTextField.text = "Current Balance: €\(x)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            for user in try db.prepare(user1){
                 if user[id] == callsUserID {
                updateCalls(x: user[calls])
                updateBalance(x: user[balance])
                //print("id is \(dataUserID)")
            }
            }
        } catch {
            print("error in main")
        }

    }
    
    @IBAction func fiveHbtn(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == callsUserID && user[balance] >= 2.5{
                    try db.run(user1.update(calls <- calls + 500, balance <- balance - 2.5))
                    updateCalls(x: user[calls])
                    updateBalance(x: user[balance])
                    break
                } else {
                    balanceTextField.text = "Insufficient Funds"
                }
            }
        } catch {
            print("error in main")
        }
    }
    
    @IBAction func oneThBtn(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == callsUserID && user[balance] >= 5{
                    try db.run(user1.update(calls <- calls + 1000, balance <- balance - 5))
                    updateCalls(x: user[calls])
                    updateBalance(x: user[balance])
                    break
                } else {
                    balanceTextField.text = "Insufficient Funds"
                }
            }
        } catch {
            print("error in main")
        }
    }
    
    @IBAction func twoThBtn(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == callsUserID && user[balance] >= 7.5{
                    try db.run(user1.update(calls <- calls + 2000, balance <- balance - 7.5))
                    updateCalls(x: user[calls])
                    updateBalance(x: user[balance])
                    break
                } else {
                    balanceTextField.text = "Insufficient Funds"
                }
            }
        } catch {
            print("error in main")
        }
    }
    
    @IBAction func fiveThBtn(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == callsUserID && user[balance] >= 10{
                    try db.run(user1.update(calls <- calls + 2000, balance <- balance - 10))
                    updateCalls(x: user[calls])
                    updateBalance(x: user[balance])
                    break
                } else {
                    balanceTextField.text = "Insufficient Funds"
                }
            }
        } catch {
            print("error in main")
        }
    }
    
}


