//
//  DataManager.swift
//  App
//
//  Created by MOZI Development on 9/25/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import Foundation

class DataManager {
    
    let api = API()
    
    func getTopAlbums(userName: String, completionHandler: (array: [Album]) -> Void) {
        var array = [Album]()
        self.api.searchFor(userName, urltipe: .Albums, completionHandler: { (JSONDictionary: NSDictionary) -> Void in
            if let topalbums = JSONDictionary["topalbums"] as? NSDictionary {
                if let albums: [AnyObject] = topalbums["album"] as? [AnyObject] {
                    for index in 0..<albums.count {
                        if let album = albums[index] as? NSDictionary {
                            if let images = album["image"] as? [AnyObject] {
                                if let image = images[2] as? NSDictionary {
                                    array.append(Album(name: album["name"] as! String, playcount: album["playcount"] as! String, imageURL: image["#text"] as! String))
                                }
                            }
                        }
                    }
                }
            }
            completionHandler(array: array)
        });
        
    }
    
    func getTopArtists(userName: String, completionHandler: (array: [Artist]) -> Void) {
        var array: [Artist] = []
        self.api.searchFor(userName, urltipe: .Artists, completionHandler: { (JSONDictionary: NSDictionary) -> Void in
            if let topartists = JSONDictionary["topartists"] as? NSDictionary {
                if let artists: [AnyObject] = topartists["artist"] as? [AnyObject] {
                    for index in 0..<artists.count {
                        if let artist = artists[index] as? NSDictionary {
                            if let images = artist["image"] as? [AnyObject] {
                                if let image = images[2] as? NSDictionary {
                                    array.append(Artist(name: artist["name"] as! String, playcount: artist["playcount"] as! String, imageURL: image["#text"] as! String))
                                }
                            }
                        }
                    }
                }
            }
            completionHandler(array: array)
        })
        
    }

    func getTopTracks(userName: String, completionHandler: (array: [Track]) -> Void) {
        var array = [Track]()
        self.api.searchFor(userName, urltipe: .Tracks, completionHandler: { (JSONDictionary: NSDictionary) -> Void in
            if let toptracks = JSONDictionary["toptracks"] as? NSDictionary {
                if let tracks: [AnyObject] = toptracks["track"] as? [AnyObject] {
                    for index in 0..<tracks.count {
                        if let track = tracks[index] as? NSDictionary {
                            array.append(Track(name: track["name"] as! String, playcount: track["playcount"] as! String))
                        }
                    }
                }
            }
            completionHandler(array: array)
        })
        
    }

    
   }