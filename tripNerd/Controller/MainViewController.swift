//
//  MainViewController.swift
//  tripNerd
//
//  Created by Eric Torigian on 4/12/18.
//  Copyright © 2018 Eric Torigian. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120

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
    
    //MARK - Tableview functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell") as! TripCellTableViewCell
        
        cell.tripNameLabel.text = "A very cool trip"
        cell.tripSummaryLabel.text = "Lots of details about a trip that will be very cool to read about and follow"
        cell.tripOwner.text = PFUser.current()?.username
        
        return cell
    }
    
}
