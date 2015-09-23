//
//  Tracks.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Tracks: UITableViewController {
    var topTracks: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let toptracks = topTracks["toptracks"] as? NSDictionary {
            if let tracks: [AnyObject] = toptracks["track"] as? [AnyObject] {
                return tracks.count
            }
        }

        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tracks Cell", forIndexPath: indexPath) as! TracksCell
        if let toptracks = topTracks["toptracks"] as? NSDictionary {
            if let tracks: [AnyObject] = toptracks["track"] as? [AnyObject] {
                if let track = tracks[indexPath.item] as? NSDictionary {
                    cell.nameLabel.text =  track["name"] as? String
                    cell.playcountLabel.text = track["playcount"] as? String
                }
            }
        }
        return cell
        
    }
    

}
