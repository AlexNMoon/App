//
//  ArtistsCell.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class ArtistsCell: UICollectionViewCell {
    @IBOutlet weak var playcountLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    func setParametrs(artist: Artist) {
        self.playcountLabel.text = artist.playcount
        self.imageView.sd_setImageWithURL(artist.imageURL)
        self.nameLabel.text = artist.name
    }

}
