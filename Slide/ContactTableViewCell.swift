//
//  ContactTableViewCell.swift
//  Slide
//
//  Created by Randy Noel on 13/06/19.
//  Copyright © 2019 whiteHat. All rights reserved.
//

import UIKit



class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
