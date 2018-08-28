//
//  CreateAccountVC.swift
//  UBet-1-0
//
//  Created by Sam Boley on 7/10/18.
//  Copyright © 2018 Sam Boley. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountVC: UIViewController {
    

    @IBOutlet weak var EmailField: SignInField!
    @IBOutlet weak var pwdField: SignInField!
    @IBOutlet weak var pwdConfirmField: SignInField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CloseBtnPressed(_ sender: Any) {
        self.view.removeFromSuperview()
    }

    @IBAction func CreateBtnPressed(_ sender: Any) {
        if let email = EmailField.text, let pwd = pwdField.text, let pwd2 = pwdConfirmField.text {
            if pwd != pwd2 {
                Helper.createAlert(view: self, title: "Passwords Don't Match", message: "Confirm your password in order to create and account.")
            } else {
                Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    if error != nil {
                        print("ALERT: Email user create authentification failed")
                        Helper.createAlert(view: self, title: "Failed to make account", message: "Your email is already in use or is invalid")
                    } else {
                        print("ALERT: Successfully authenticated with Firebase")
                        Helper.createAlert(view: self, title: "Account Created", message: "Your account has been created. Sign in on the home screen to continue.")
                    }})
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
