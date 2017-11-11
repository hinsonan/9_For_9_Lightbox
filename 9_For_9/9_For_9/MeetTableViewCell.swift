//
//  MeetTableViewCell.swift
//  9_For_9
//
//  Created by Andrew Hinson on 11/4/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class MeetTableViewCell: UITableViewCell {

    @IBOutlet weak var meetCellImage: UIImageView!
    @IBOutlet weak var meetCellName: UILabel!
    @IBOutlet weak var meetCellLocation: UILabel!    
    @IBOutlet weak var meetDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
