//
//  API.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import Foundation

class API : NSObject, NSURLConnectionDataDelegate, NSURLConnectionDelegate{
    
    var JSONDictionary: NSDictionary = [:]
    
    func searchFor(searchTerm: String) {
        var lastfmSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        var escapedSearchTerm = lastfmSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        var url: NSURL = NSURL(string: escapedSearchTerm!)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            self.JSONDictionary = jsonResult
            println("AsSynchronous\(self.JSONDictionary)")
        })
        
    }
}