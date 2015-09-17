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
    var topAlbums: NSDictionary = [:]
    var topArtists: NSDictionary = [:]
    var topTracks: NSDictionary = [:]
    var api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.searchFor("http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=rj&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json")
        topAlbums = api.JSONDictionary
        api.searchFor("http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=rj&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json")
        topArtists = api.JSONDictionary
        api.searchFor("http://ws.audioscrobbler.com/2.0/?method=user.gettoptracks&user=rj&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json")
        topTracks = api.JSONDictionary
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueDataAlbums") {
            var albumsView = segue.destinationViewController as! Albums
            albumsView.topAlbums = topAlbums
        } else {
            if (segue.identifier == "segueDataArtists") {
                var artistsView = segue.destinationViewController as! Artists
                artistsView.topArists = topArtists
            } else {
                if (segue.identifier == "segueDataTracks") {
                    var tracksView = segue.destinationViewController as! Tracks
                    tracksView.topTracks = topTracks
                }
            }
        }
    }
}
