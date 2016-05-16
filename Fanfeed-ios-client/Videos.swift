//
//  Videos.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 1/8/16.
//  Copyright © 2016 Fanfeed, Inc. All rights reserved.
//

//import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class Videos: NSObject {
    static let endpoint = "\(ApiHelper.basePath)videos"
    

//    the all method has a callback: parameter that takes a function that inputs a video object and returns void
    static func all(callback: ([Video]?) -> Void) {
        Alamofire.request(.POST, endpoint) .responseJSON { response in
        print(response.request)  // original URL request
        print(response.response) // URL response
//        print(response.data)     // server data
        print(response.result)   // result of response serialization
            
        if let value = response.result.value {
        let json = JSON(value)
            print(json)
            
                    callback(json.map { (key, item) -> Video in
                        let video = Video(item: item)
                        return video
                    })
                }
                
                callback(nil)
        }

        
    }
    
    }