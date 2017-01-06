//
//  Connection.swift
//  Giphy
//
//  Created by Admin on 1/2/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit
import Alamofire

class Connection: NSObject {
    
    
    func getGifs(success:(response: [Gif]!) -> Void,
                 failure:(error: NSError?) -> Void
                 ){
        let params = [Constants.API_KEY_PARAM: Constants.API_KEY];
        Alamofire.request(.GET, Constants.BASE_URL + Constants.TRENDING_URL, parameters: params).responseJSON {
            response in switch response.result {
            case .Success(let JSON):
                let response = JSON as! NSDictionary;
                let data = response.objectForKey("data") as! NSMutableArray;
                success(response: self.parseResponse(data));
               
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
    }
    
    func getGifsSearch(searchText: String, success:(response: [Gif]!) -> Void,
                       failure:(error: NSError?) -> Void
        ){
        let params = [Constants.API_KEY_PARAM: Constants.API_KEY,
                      Constants.SEARCH_PARAM: searchText];
        Alamofire.request(.GET, Constants.BASE_URL + Constants.SEARCH_URL, parameters: params).responseJSON {
            response in switch response.result {
            case .Success(let JSON):
                let response = JSON as! NSDictionary;
                let data = response.objectForKey("data") as! NSMutableArray;
                success(response: self.parseResponse(data));
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    func parseResponse(data: NSMutableArray) -> [Gif]{
        var arr = [Gif]();
        for dat in data{
            let original = dat.objectForKey("images")?.objectForKey("original");
            let frames: String = original?.objectForKey("frames") as! String;
            let url: String = original?.objectForKey("url") as! String;
            let height: String = original?.objectForKey("height") as! String;
            let width: String = original?.objectForKey("width") as! String;
            let gif: Gif = Gif(id: dat.objectForKey("id") as! String, imageUrl: url, imageFrames: frames, height: height, width: width);
            arr.append(gif);
        }
        return arr;
    }

}
