//
//  ViewController.swift
//  tripNerd
//
//  Created by Eric Torigian on 4/12/18.
//  Copyright © 2018 Eric Torigian. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let trip = PFObject(className: "trips")
        
        trip["tripName"] = "Test Trip"
        trip["tripOwner"] = "eric"
        trip["tripSummary"] = "test trip to make sure parse connection is working"
        
        trip.saveInBackground { (success, error) in
            if error == nil {
                print("record saved, parse is connected")
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
        
    }

   


}

