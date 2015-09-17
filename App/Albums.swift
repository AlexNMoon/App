//
//  Albums.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Albums: UICollectionViewController {
    
    var api = API()
    var albumCount = 0
    var topAlbums: NSDictionary!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let albums: AnyObject = topAlbums["topalbums"] {
            if let album: AnyObject? = albums["album"] {
                albumCount = album!.count
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumCount
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Albums Cell", forIndexPath: indexPath) as! AlbumsCell
        if let topalbums: AnyObject = topAlbums["topalbums"] {
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
