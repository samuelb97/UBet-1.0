//
//  SettingsVC.swift
//  UBet-1-0
//
//  Created by Sam Boley on 7/17/18.
//  Copyright © 2018 Sam Boley. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class SettingsVC: UIViewController {

    @IBAction func BackBtnPressed(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func SignOutBtnPressed(_ sender: Any) {
        print("ALERT: Sign Out Pressed")
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ALERT: keychainResult: \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
