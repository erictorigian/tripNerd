//
//  TripCellTableViewCell.swift
//  tripNerd
//
//  Created by Eric Torigian on 4/12/18.
//  Copyright © 2018 Eric Torigian. All rights reserved.
//

import UIKit

class TripCellTableViewCell: UITableViewCell {

    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var tripSummaryLabel: UILabel!
    @IBOutlet weak var tripOwner: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
