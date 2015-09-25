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
    var topTracks: [Track] = []
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.dataManager.getTopTracks(userName, completionHandler: { (array: [Track]) -> Void in
            self.topTracks = array 
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if topTracks.count > 0 {
            return topTracks.count
        }
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tracks Cell", forIndexPath: indexPath) as! TracksCell
        if topTracks.count > 0 {
        cell.setParametrs(topTracks[indexPath.item])
        }
        return cell
        
    }
    

}
// Parse dictionaries to model structs