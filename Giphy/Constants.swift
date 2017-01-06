//
//  Constants.swift
//  Giphy
//
//  Created by Admin on 1/2/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    public static let API_KEY:       String = "dc6zaTOxFJmzC";
    
//  URLS
    public static let BASE_URL:      String = "http://api.giphy.com";
    public static let TRENDING_URL:  String = "/v1/gifs/trending";
    public static let SEARCH_URL:    String = "/v1/stickers/search";

//  parameters
    public static let API_KEY_PARAM: String = "api_key";
    public static let SEARCH_PARAM:  String = "q";
    
}
