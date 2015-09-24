//
//  TracksCell.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class TracksCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var playcountLabel: UILabel!
    
    func setParametrs(track: Track) {
        self.playcountLabel.text = track.playcount
        self.nameLabel.text = track.name
    }


}
