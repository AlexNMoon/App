//
//  Artists.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Artists: UICollectionViewController {
    var topArtists: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.collectionView!.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let topartists = topArtists["topartists"] as? NSDictionary {
            if let artist: [AnyObject] = topartists["artist"] as? [AnyObject] {
                return artist.count
            }
        }
        
        return 2
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Artists Cell", forIndexPath: indexPath) as! ArtistsCell
        if let topartists = topArtists["topartists"] as? NSDictionary {
            if let artists: [AnyObject] = topartists["artist"] as? [AnyObject] {
                if let artist = artists[indexPath.item] as? NSDictionary {
                    cell.nameLabel.text =  artist["name"] as? String
                    cell.playcountLabel.text = artist["playcount"] as? String
                    if let images = artist["image"] as? [AnyObject] {
                        if let image = images[2] as? NSDictionary {
                            let url = NSURL(string: image["#text"] as! String)
                            let imageURL = NSData(contentsOfURL: url!)
                            cell.imageView.sd_setImageWithURL(url!)
                        }
                    }
                }
            }
        }
        return cell
    }

}
