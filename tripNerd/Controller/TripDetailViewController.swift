//
//  TripDetailViewController.swift
//  tripNerd
//
//  Created by Eric Torigian on 4/13/18.
//  Copyright © 2018 Eric Torigian. All rights reserved.
//

import UIKit
import Parse

class TripDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripNameTextField: UITextField!
    @IBOutlet weak var tripSummaryTextField: UITextField!
    
    var tripObject = PFObject(className: "Trips")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tripNameTextField.text = tripObject["tripName"] as? String
        tripSummaryTextField.text = tripObject["tripSummary"] as? String
    }

    
    //MARK - tableview functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCommentCell")
        
        cell?.textLabel?.text = "Comment"
        
        return cell!
    }
}
