//
//  smsViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 29/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import UIKit
import SQLite

class smsViewController: mainViewController {
    var smsUserID = 0
    
    @IBOutlet weak var smsTextField: UILabel!
    @IBOutlet weak var balanceTextField: UILabel!
    
    func updateSms(x: Int){
        smsTextField.text = "Your available Sms: \(x) SMS"
    }
    func updateBalance(x: Double){
        balanceTextField.text = "Current Balance: €\(x)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            for user in try db.prepare(user1){
                if user[id] == smsUserID {
                    updateSms(x: user[sms])
                    updateBalance(x: user[balance])
                    //print("id is \(dataUserID)")
                }
            }
        } catch {
            print("error in main")
        }
    }
    
    @IBAction func fifty(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == smsUserID && user[balance] >= 2.5{
                    try db.run(user1.update(sms <- sms + 50, balance <- balance - 2.5))
                    updateSms(x: user[sms])
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
    
    @IBAction func fourHBtn(_ sender: UIButton) {
        do {
            for user in try db.prepare(user1){
                if user[id] == smsUserID && user[balance] >= 5{
                    try db.run(user1.update(sms <- sms + 400, balance <- balance - 5))
                    updateSms(x: user[sms])
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
                if user[id] == smsUserID && user[balance] >= 7.5{
                    try db.run(user1.update(sms <- sms + 1000, balance <- balance - 7.5))
                    updateSms(x: user[sms])
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
                if user[id] == smsUserID && user[balance] >= 10{
                    try db.run(user1.update(sms <- sms + 2000, balance <- balance - 10))
                    updateSms(x: user[sms])
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
