//
//  Artists.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Artists: UICollectionViewController {
    
    var dataManager = DataManager()
    var topArtists: [Artist] = []
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.dataManager.getTopArtists(userName, completionHandler: { (array: [Artist]) -> Void in
            self.topArtists = array 
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.collectionView!.reloadData()
            })
            })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if topArtists.count > 0 {
            return topArtists.count
        }
        return 0
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Artists Cell", forIndexPath: indexPath) as! ArtistsCell
        if topArtists.count > 0 {
        cell.setParametrs(topArtists[indexPath.item])
        }
        return cell
    }

}
