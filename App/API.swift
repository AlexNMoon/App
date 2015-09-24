//
//  API.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import Foundation

class API : NSObject, NSURLConnectionDataDelegate, NSURLConnectionDelegate{
    
    let queue:NSOperationQueue = NSOperationQueue()
    
    enum urlTipe {
        case Artists
        case Albums
        case Tracks
    }
    
    func searchFor(userName: String, urltipe: urlTipe, completionHandler: (JSONDictionary: NSDictionary) -> Void) {
        var JSONDictionary: NSDictionary!
        let searchTerm = searchUrl(userName, urltipe: urltipe)
        var lastfmSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        var escapedSearchTerm = lastfmSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        var url: NSURL = NSURL(string: escapedSearchTerm!)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request1, queue: self.queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            JSONDictionary = jsonResult
            completionHandler(JSONDictionary: JSONDictionary)
            println("AsSynchronous\(JSONDictionary)")
        })
        
    }
    
    func searchUrl(userName: String, urltipe: urlTipe) -> String {
        if urltipe == urlTipe.Albums {
           return "http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=\(userName)&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json"
        }
        if urltipe == urlTipe.Artists {
            return "http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=\(userName)&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json"
        }
        if urltipe == urlTipe.Tracks {
            return "http://ws.audioscrobbler.com/2.0/?method=user.gettoptracks&user=\(userName)&api_key=6d7403baf4120f299266f1fa0da3f2ef&format=json"
        }
        return ""
    }
}

// enumertion
// create url using enumeration value and username
// make queue a propertie