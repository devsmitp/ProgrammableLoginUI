//
//  MessageController.swift
//  ProgrammableLoginUI
//
//  Created by Smit Patel on 3/11/18.
//  Copyright © 2018 devsmitp. All rights reserved.
//

import UIKit

class LogOutController : UITableViewController {
    
        override func viewDidLoad() {
        super.viewDidLoad()
//MARK: Sign Out Navigation Button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleLogOut))
        }
 
//MARK: Handle Log Out
        @objc func handleLogOut(){
        let LoginController1 = LoginController()
        present(LoginController1, animated: true, completion: nil)
        }
    
        }



