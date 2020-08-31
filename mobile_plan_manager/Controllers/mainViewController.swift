//
//  mainViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 26/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import UIKit
import SQLite

class mainViewController: loginViewController {
    
    let user1 = Table("users")
    let name = Expression<String?>("name")
    let balance = Expression<Double>("balance")
    let data = Expression<Int>("data")
    let calls = Expression<Int>("calls")
    let sms = Expression<Int>("sms")
    var userID = 0
    
    
    @IBOutlet weak var helloUserTextLabel: UILabel!
    
    @IBOutlet weak var mainBalanceTextField: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            for user in try db.prepare(user1){
                //  print(userID)
                if user[id] == userID {
                    helloUserTextLabel.text = "Hello, \(user[name] ?? "Hello, User")"
                    mainBalanceTextField.setTitle("€\(user[balance])", for: .normal)
                }
            }
        } catch {
            print("error in main")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "balanceSegue"{
            let balance  = segue.destination as! balanceViewController
            balance.balanceUserID = self.userID
        }
        if segue.identifier == "dataSegue"{
            let data = segue.destination as! dataViewController
            data.dataUserID = self.userID
        }
        if segue.identifier == "callsSegue"{
                   let calls = segue.destination as! callsViewController
            calls.callsUserID = self.userID
        }
        if segue.identifier == "smsSegue"{
                   let sms = segue.destination as! smsViewController
            sms.smsUserID = self.userID
        }
    }
}
