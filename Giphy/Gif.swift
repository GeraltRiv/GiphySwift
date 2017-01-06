//
//  Gif.swift
//  Giphy
//
//  Created by Admin on 1/2/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

class Gif: NSObject {
    
    public var id:          String;
    public var imageUrl:    String;
    public var imageFrames: String;
    public var height:      String;
    public var width:       String;
    
    public init(id: String, imageUrl: String, imageFrames: String, height: String, width: String) {
        self.id          = id;
        self.imageUrl    = imageUrl;
        self.imageFrames = imageFrames;
        self.height      = height;
        self.width       = width;
    }

}
