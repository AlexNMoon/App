//
//  Artists.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Artists: UICollectionViewController {
    
    var apiArtists = API()
    var topArtists: [Artist]!
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.apiArtists.searchFor(userName, urltipe: .Artists, completionHandler: { (JSONDictionary: NSDictionary) -> Void in
            if let topartists = JSONDictionary["topartists"] as? NSDictionary {
                if let artists: [AnyObject] = topartists["artist"] as? [AnyObject] {
                    for index in 0..<artists.count {
                        if let artist = artists[index] as? NSDictionary {
                            if let images = artist["image"] as? [AnyObject] {
                                if let image = images[2] as? NSDictionary {
                                    self.topArtists[index] = Artist(name: artist["name"] as! String, playcount: artist["playcount"] as! String, imageURL: image["#text"] as! String)
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
        if topArtists != nil {
            return topArtists.count
        }
        return 2
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Artists Cell", forIndexPath: indexPath) as! ArtistsCell
        if topArtists != nil {
        cell.setParametrs(topArtists[indexPath.item])
        }
        return cell
    }

}
