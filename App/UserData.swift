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
    var apiAlbums = API()
    var apiArtists = API()
    var apiTracks = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiAlbums.searchFor("http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=rj&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json")
        apiArtists.searchFor("http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=rj&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json")
        apiTracks.searchFor("http://ws.audioscrobbler.com/2.0/?method=user.gettoptracks&user=rj&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueDataAlbums") {
            var albumsView = segue.destinationViewController as! Albums
            albumsView.topAlbums = apiAlbums.JSONDictionary
        } else {
            if (segue.identifier == "segueDataArtists") {
                var artistsView = segue.destinationViewController as! Artists
                artistsView.topArists = apiArtists.JSONDictionary
            } else {
                if (segue.identifier == "segueDataTracks") {
                    var tracksView = segue.destinationViewController as! Tracks
                    tracksView.topTracks = apiTracks.JSONDictionary
                }
            }
        }
    }
}
