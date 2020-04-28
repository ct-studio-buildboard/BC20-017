//
//  GroupTableViewCell.swift
//  spotifyGroups
//
//  Created by Jae Min Cha on 25/04/2020.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
