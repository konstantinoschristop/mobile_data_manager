//
//  ViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 12/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import UIKit
import SQLite



class ViewController: UIViewController {
    
    var db: Connection!
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let dbPath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = dbPath.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let db = try Connection(fileURL.path)
            // print(fileURL.path)
            self.db = db
        } catch {
            print("db already exists")
        }
        
        
        let users = Table("users")
        let id = Expression<Int64>("id")
        let name = Expression<String?>("name")
        let email = Expression<String>("email")
        let password = Expression<String>("password")
        let balance = Expression<Double>("balance")
        let data = Expression<Int>("data")
        let calls = Expression<Int>("calls")
        let sms = Expression<Int>("sms")
        
        do{
            try db.scalar(users.exists)
            print("table already exists")
        } catch {
            do {
                try db.run(users.create { t in
                    t.column(id, primaryKey: true)
                    t.column(name)
                    t.column(email, unique: true)
                    t.column(password)
                    t.column(balance, defaultValue: 0)
                    t.column(data, defaultValue: 0)
                    t.column(calls, defaultValue: 0)
                    t.column(sms, defaultValue: 0)
                })
                print("table created")
            } catch {
                print("cant create table")
            }
        }
    }
}






