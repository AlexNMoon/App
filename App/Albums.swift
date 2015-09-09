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
    var JSONDictionary: NSDictionary = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        api.searchFor("http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=rj&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json")
        JSONDictionary = api.JSONDictionary
        if let topalbums: AnyObject = JSONDictionary["topalbums"] {
            if let album: AnyObject? = topalbums["album"] {
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
        if let topalbums: AnyObject = JSONDictionary["topalbums"] {
            if let albums: [AnyObject] = topalbums["album"] as? [AnyObject] {
                if let album: AnyObject = albums[indexPath.item] as? AnyObject{
                    cell.nameLabel.text =  album["name"]
                }
            }
        }
        return cell
    }
    

}
