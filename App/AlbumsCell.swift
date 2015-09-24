//
//  AlbumsCell.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class AlbumsCell: UICollectionViewCell {

    @IBOutlet weak var playcountLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func setParametrs(album: Album) {
        self.playcountLabel.text = album.playcount
        self.imageView.sd_setImageWithURL(album.imageURL)
        self.nameLabel.text = album.name
    }
    
}
