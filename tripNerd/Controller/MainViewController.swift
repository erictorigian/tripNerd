//
//  MainViewController.swift
//  tripNerd
//
//  Created by Eric Torigian on 4/12/18.
//  Copyright © 2018 Eric Torigian. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController {

    @IBOutlet weak var userButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentUser = PFUser.current()
        
        if currentUser != nil {
            // Do stuff with the user
            userButton.title = currentUser?.username
        } else {
            // Show the signup or login screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let loginViewController =  storyboard.instantiateViewController(withIdentifier: "loginViewController")
            
            self.present(loginViewController, animated: true, completion: nil)
        }
    }

    @IBAction func userButtonPressed(_ sender: Any) {
        PFUser.logOut()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController =  storyboard.instantiateViewController(withIdentifier: "loginViewController")
        
        self.present(loginViewController, animated: true, completion: nil)
    }
    
}
