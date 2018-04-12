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
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupQuestionLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if loginMode {
            emailTextField.isHidden = true
        }
 
        }
 
    //MARK - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        if loginMode {
            //log a user in
            if usernameTextField.text == "" || passwordTextField.text == "" {
                self.showAlert(title: "Error in Form", message: "You must include both an username and password to login")
            } else {
                PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                        if error == nil {
                            //logged in
                            self.showAlert(title: "Thank you", message: "Thank you for logging into Trip Nerd.  Opening system now")
                        } else  {
                            //error logging in
                            self.showAlert(title: "Error Logging into TripNerd", message: (error?.localizedDescription)!)
                        }
                }
                
            }
        } else {
            //sign a user up
            if usernameTextField.text != nil {
                if emailTextField.text != nil {
                    if passwordTextField.text != nil  {
                        let user = PFUser()
    
                        user.username = usernameTextField.text
                        user.email = emailTextField.text
                        user.password = passwordTextField.text
    
                        user.signUpInBackground { (success, error) in
                            if error == nil {
                                self.showAlert(title: "Success", message: "You have successfully signed up for Trip Nerd")
                            } else {
                                self.showAlert(title: "Error", message: (error?.localizedDescription)!)
                            }
                        }
                    }
                }
            }
    
    
    
        }
    }

    @IBAction func signInButtonPressed(_ sender: Any) {
        if loginMode == true {
            emailTextField.isHidden = false
            loginMode = false
            loginButton.setTitle("Sign Up", for: .normal)
            signupQuestionLabel.text = "Click here to cancel signup"
            signupButton.setTitle("Log In", for: .normal)
        } else {
            emailTextField.isHidden = true
            loginMode = true
            loginButton.setTitle("Log In", for: .normal)
            signupQuestionLabel.text = "Don't have an account on Trip Nerd?"
            signupButton.setTitle("Sign Up", for: .normal)
        }
    }

    //MARK - support functions
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}

