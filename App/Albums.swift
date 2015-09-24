//
//  Albums.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Albums: UICollectionViewController {

    var topAlbums: [Album]!
    var apiAlbums = API()
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.apiAlbums.searchFor(userName, urltipe: .Albums, completionHandler: { (JSONDictionary: NSDictionary) -> Void in
            if let topalbums = JSONDictionary["topalbums"] as? NSDictionary {
                if let albums: [AnyObject] = topalbums["album"] as? [AnyObject] {
                    for index in 0..<albums.count {
                        if let album = albums[index] as? NSDictionary {
                            if let images = album["image"] as? [AnyObject] {
                                if let image = images[2] as? NSDictionary {
                                    self.topAlbums[index] = Album(name: album["name"] as! String, playcount: album["playcount"] as! String, imageURL: image["#text"] as! String)
                                }
                            }
                        }
                    }
                }
            }
            self.collectionView!.reloadData()
        })
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if topAlbums != nil {
            return topAlbums.count
        }
        return 2
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Albums Cell", forIndexPath: indexPath) as! AlbumsCell
        if topAlbums != nil {
        cell.setParametrs(topAlbums[indexPath.item])
        }
        return cell
    }
    

}
