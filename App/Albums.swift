//
//  Albums.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Albums: UICollectionViewController {

    var topAlbums: NSDictionary!
    
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
        if let topalbums = topAlbums["topalbums"] as? NSDictionary {
            if let albums: [AnyObject] = topalbums["album"] as? [AnyObject] {
                return albums.count
            }
        }

        return 2
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Albums Cell", forIndexPath: indexPath) as! AlbumsCell
        if let topalbums = topAlbums["topalbums"] as? NSDictionary {
            if let albums: [AnyObject] = topalbums["album"] as? [AnyObject] {
                if let album = albums[indexPath.item] as? NSDictionary {
                    cell.nameLabel.text =  album["name"] as? String
                    cell.playcountLabel.text = album["playcount"] as? String
                    if let images = album["image"] as? [AnyObject] {
                        if let image = images[0] as? NSDictionary {
                            let url = NSURL(string: image["#text"] as! String)
                            let imageURL = NSData(contentsOfURL: url!)
                            cell.imageView.image = UIImage(data: imageURL!)
                        }
                    }
                }
            }
        }
        return cell
    }
    

}
