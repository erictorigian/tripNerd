//
//  AddTripViewController.swift
//  tripNerd
//
//  Created by Eric Torigian on 4/13/18.
//  Copyright © 2018 Eric Torigian. All rights reserved.
//

import UIKit
import Parse
import CoreLocation

class AddTripViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tripNameTextField: UITextField!
    @IBOutlet weak var tripSummaryTextField: UITextField!
    
    let locationManager = CLLocationManager()
    var lastLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tripNameTextField.becomeFirstResponder()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    //MARK - IBActions
    @IBAction func photoTapped(_ sender: Any) {
        print("photo tapped")
    }
    
    
    @IBAction func saveTripButtonPressed(_ sender: Any) {
        if tripNameTextField == nil || tripSummaryTextField == nil {
            showAlert(title: "Unable to upload", message: "You must enter both a Trip Name and Summary to save")
        } else {
            let tripObject = PFObject(className: "Trips")
            
            let point = PFGeoPoint(location: lastLocation )
            
            tripObject["tripName"] = tripNameTextField.text
            tripObject["tripSummary"] = tripSummaryTextField.text
            tripObject["tripOwner"] = PFUser.current()?.username
            tripObject["location"] = point
            
            
            tripObject.saveInBackground { (success, error) in
                if error == nil {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    self.showAlert(title: "Unable to create your new trip", message: (error?.localizedDescription)!)
                }
            }
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.lastLocation = locations[0]
    }
    
}
