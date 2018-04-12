//
//  loginViewController.swift
//  tripNerd
//
//  Created by Eric Torigian on 4/12/18.
//  Copyright © 2018 Eric Torigian. All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {

    var loginMode = true
    
    //MARK - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupQuestionLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        }
 
    //MARK - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        if loginMode {
            //log a user in
        } else {
            //sign a ueser up
            
            
            
        }
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        if loginMode == true {
            loginMode = false
            loginButton.setTitle("Sign Up", for: .normal)
            signupQuestionLabel.text = "Click here to cancel signup"
            signupButton.setTitle("Log In", for: .normal)
        } else {
            loginMode = true
            loginButton.setTitle("Log In", for: .normal)
            signupQuestionLabel.text = "Don't have an account on Trip Nerd?"
            signupButton.setTitle("Sign Up", for: .normal)
        }
    }
    
}

