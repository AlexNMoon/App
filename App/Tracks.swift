//
//  Tracks.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class Tracks: UITableViewController {
    
    var userName: String!
    var topTracks: [Track]!
    var apiTracks = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.apiTracks.searchFor(userName, urltipe: .Tracks, completionHandler: { (JSONDictionary: NSDictionary) -> Void in
            if let toptracks = JSONDictionary["toptracks"] as? NSDictionary {
                if let tracks: [AnyObject] = toptracks["track"] as? [AnyObject] {
                    for index in 0..<tracks.count {
                        if let track = tracks[index] as? NSDictionary {
                            self.topTracks[index] = Track(name: track["name"] as! String, playcount: track["playcount"] as! String)
                        }
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if topTracks != nil {
            return topTracks.count
        }
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tracks Cell", forIndexPath: indexPath) as! TracksCell
        if topTracks != nil {
        cell.setParametrs(topTracks[indexPath.item])
        }
        return cell
        
    }
    

}
// Parse dictionaries to model structs