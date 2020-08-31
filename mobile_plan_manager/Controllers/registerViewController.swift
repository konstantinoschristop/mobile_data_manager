//
//  registerViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 24/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import Foundation
import SQLite

class registerViewController: ViewController  {
    
    
    let users = Table("users")
    let name = Expression<String?>("name")
    let email = Expression<String?>("email")
    let password = Expression<String?>("password")
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signupPressed(_ sender: UIButton) {
        do {
            let insert = try users.insert(name <- nicknameTextField.text, email <- emailTextField.text, password <- passwordTextField.text)
            let rowid = try db.run(insert)
        } catch {
            print("error inserting")
        }
        }
    }

