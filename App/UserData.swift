//
//  UserData.swift
//  App
//
//  Created by MOZI Development on 9/17/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import UIKit

class UserData: UIViewController {
    
    var userName: String!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueDataAlbums") {
            var albumsView = segue.destinationViewController as! Albums
            albumsView.userName = self.userName
        }
        if (segue.identifier == "segueDataArtists") {
            var artistsView = segue.destinationViewController as! Artists
            artistsView.userName = self.userName
        }
        if (segue.identifier == "segueDataTracks") {
            var tracksView = segue.destinationViewController as! Tracks
            tracksView.userName = self.userName
        }
    }
    
    
}
