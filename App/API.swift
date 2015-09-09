//
//  API.swift
//  App
//
//  Created by MOZI Development on 9/9/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import Foundation

class API : NSObject, NSURLConnectionDataDelegate, NSURLConnectionDelegate{
    
    var data: NSMutableData = NSMutableData()
    
    var JSONDictionary: NSDictionary = [:]
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("Connection failed.\(error.localizedDescription)")
    }
    
    func connection(connection: NSURLConnection, didRecieveResponse response: NSURLResponse)  {
        println("Recieved response")
    }
    
    
    func connection(didReceiveResponse: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        // Recieved a new request, clear out the data object
        self.data = NSMutableData()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        // Append the recieved chunk of data to our data object
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        // Request complete, self.data should now hold the resulting info
        // Convert it to a string
        var dataAsString: NSString = NSString(data: self.data, encoding: NSUTF8StringEncoding)!
        
        // Convert the retrieved data in to an object through JSON deserialization
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        JSONDictionary = jsonResult
        
    }
    
    
    func searchFor(searchTerm: String) {
        var lastfmSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        var escapedSearchTerm = lastfmSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        var url: NSURL = NSURL(string: escapedSearchTerm!)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        
        println("Search last.fm API at URL \(url)")
        
        connection.start()
    }

}
