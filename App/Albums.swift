//
//  Albums.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Albums: UICollectionViewController {

    var topAlbums: [Album] = []
    var dataManager = DataManager()
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.dataManager.getTopAlbums(userName, completionHandler: {(array: [Album]) -> Void in
            self.topAlbums = array
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.collectionView!.reloadData()
            });
            })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if topAlbums.count > 0 {
            return topAlbums.count
        }
        return 0
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Albums Cell", forIndexPath: indexPath) as! AlbumsCell
        if topAlbums.count > 0 {
        cell.setParametrs(topAlbums[indexPath.item])
        }
        return cell
    }
    

}
