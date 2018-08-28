//
//  SignInVC.swift
//  UBet-1-0
//
//  Created by Sam Boley on 7/9/18.
//  Copyright © 2018 Sam Boley. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: SignInField!
    @IBOutlet weak var pwdField: SignInField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("ALERT: ID Found in keychain")
            performSegue(withIdentifier: "GoToMain", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FBBtnTapped(_ sender: Any) {
        print("ALERT: FB Button Pressed")
        let facebookLogin = FBSDKLoginManager()
        print("ALERT: FB Login Manager Called")
        facebookLogin.logIn(withReadPermissions:  ["email"], from: self) { (result, error) in
            if error != nil {
                print("ALERT: Unable to authenticate with Facebook")
            } else if result?.isCancelled == true {
                print("ALERT: User Cancelled Facebook Authentication")
            } else {
                print("ALERT: Successfully authenticated with Facebook")
                
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
                self.firebaseAuth(credential)
                
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("ALERT: Unable to autveDataWithCredential:completion: for Objective-C or signInAndRetrieveData(with:completion:) for Swift instead.henticate with Firebase - \(error)")
            }
            else {
                print("ALERT: Successfully Authenticated with Firebase")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
            }
        })
        
    }
    
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("ALERT: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "GoToMain", sender: nil)
    }
    @IBAction func signInTapped(_ sender: Any) {
        print("ALERT: SignInButton Pressed")
        //Only IF fields have text in them
        if let email = emailField.text, let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Successfully Signed in with Email")
                    if let user = user {
                        self.completeSignIn(id: user.user.uid)
                    }
                } else {
                    print("ALERT: Firebase Authentication Failed")
                    Helper.createAlert(view: self, title: "Invalid Email/Password", message: "Create an Account or Sign in through Facebook")
                }
            })
        }
    }
    
    @IBAction func CreateAccountBtnPressed(_ sender: Any) {
        print("ALERT: Create Account Button Pressed")
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateAccountVC") as! CreateAccountVC
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    

}
