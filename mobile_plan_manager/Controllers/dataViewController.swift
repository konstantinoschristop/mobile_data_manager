//
//  balanceViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 26/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import UIKit
import SQLite

class dataViewController: mainViewController {
    var dataUserID = 0
    
    func updateData(x: Int){
        let data = x*1024
        dataTextField.text = "Your available Data: \(data) MB"
    }
    func updateBalance(x: Double){
           balanceTextField.text = "Current Balance: €\(x)"
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            for user in try db.prepare(user1){
                 if user[id] == dataUserID {
                updateData(x: user[data])
                updateBalance(x: user[balance])
                //print("id is \(dataUserID)")
            }
            }
        } catch {
            print("error in main")
        }
        
    }
    
    @IBOutlet weak var dataTextField: UILabel!
    
    @IBOutlet weak var balanceTextField: UILabel!
    
    @IBAction func fiveGB(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == dataUserID && user[balance] >= 5{
                    try db.run(user1.update(data <- data + 5, balance <- balance - 5))
                    updateData(x: user[data])
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
    
    @IBAction func tenGB(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == dataUserID, user[balance] >= 10 {
                    try db.run(user1.update(data <- data + 10, balance <- balance - 10))
                    updateData(x: user[data])
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
    
    @IBAction func twentyGB(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == dataUserID, user[balance] >= 15 {
                    try db.run(user1.update(data <- data + 20, balance <- balance - 15))
                    updateData(x: user[data])
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
    
    @IBAction func fourtyGB(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == dataUserID, user[balance] >= 20 {
                    try db.run(user1.update(data <- data + 40, balance <- balance - 20))
                    updateData(x: user[data])
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
