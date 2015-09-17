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
        var error: NSErrorPointer = NSErrorPointer()
        // Request complete, self.data should now hold the resulting info
        // Convert it to a string
        var dataAsString: NSString = NSString(data: self.data, encoding: NSUTF8StringEncoding)!
        
        // Convert the retrieved data in to an object through JSON deserialization
       // let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error)
//        if let jsonResult: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) {
       // if let jsonResult = json as? [String: AnyObject] {
//            let dictionary: Dictionary<String, AnyObject> = (jsonResult as? Dictionary<String, AnyObject>)!

        if let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary{
            println(json)
            println("nil")
            } else {
                println("false")
        }
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
