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
    
    var tripObjects = [PFObject(className: "Trips")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentUser = PFUser.current()
        
        if currentUser != nil {
            // Do stuff with the user
            userButton.title = currentUser?.username
            
            //get trips from Parse
            let query = PFQuery(className: "Trips")
            
            query.findObjectsInBackground { (objects, error) in
                if error != nil {
                    print(error!)
                } else if let trips = objects {
                    self.tripObjects.removeAll()
                    
                    for object in trips {
                        self.tripObjects.append(object)
                    }
                    
                    self.tableView.reloadData()
                    
                }
            }
            
            
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
        return tripObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell") as! TripCellTableViewCell
        
        let tripObject = tripObjects[indexPath.row]
        
        cell.tripNameLabel.text = tripObject["tripName"] as? String
        cell.tripSummaryLabel.text = tripObject["tripSummary"] as? String
        cell.tripOwner.text = tripObject["tripOwner"] as? String
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTripDetails" {
            let destinationVC = segue.destination as? TripDetailViewController
            
            let tripIndex = tableView.indexPathForSelectedRow?.row
            
            destinationVC?.tripObject = tripObjects[tripIndex!]
            
        }
    }
}
