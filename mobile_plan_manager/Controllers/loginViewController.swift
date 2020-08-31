//
//  loginViewController.swift
//  mobile_plan_manager
//
//  Created by Konstantinos Christopoulos on 24/8/20.
//  Copyright © 2020 Konstantinos Christopoulos. All rights reserved.
//

import Foundation
import SQLite

class loginViewController: ViewController{
    
    let users = Table("users")
    let email = Expression<String>("email")
    let password = Expression<String>("password")
    var doesExist = false
    let id = Expression<Int>("id")
    var idforMain = 0
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextField: UILabel!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        do {
            for user in try db.prepare(users){
                if (user[email] == emailTextField.text && user[password] == passwordTextField.text) {
                    doesExist = true
                    self.idforMain = user[id]
                    
                   // print(idforMain)
                }
            }
            if (doesExist == true) {
                self.performSegue(withIdentifier: "loginSegue", sender: self)

            } else {
                errorTextField.text = "User doesn't exit or wrong credentials"
              
            }
        
        } catch {
    print("cant login")
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let main  = segue.destination as! mainViewController
       
//        let data = segue.destination as!
//        let calls = segue.destination as!
//        let sms = segue.destination as!
        main.userID = self.idforMain
         
    //

        
    }
}


