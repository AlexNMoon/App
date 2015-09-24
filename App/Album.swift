//
//  Album.swift
//  App
//
//  Created by MOZI Development on 9/24/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import Foundation

struct Album {
    
    let name: String
    let playcount: String
    let imageURL: NSURL
    
    init(name: String, playcount: String, imageURL: String) {
        self.name = name
        self.playcount = playcount
        self.imageURL = NSURL(string: imageURL as String)!
    }
    

}