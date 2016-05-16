//
//  Thumbnail.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 1/13/16.
//  Copyright © 2016 Fanfeed, Inc. All rights reserved.
//

import UIKit
import AlamofireImage
import SwiftyJSON
import RealmSwift
import Alamofire

class Thumbnail: NSObject {
    static let endpoint = "\(ApiHelper.mediaPath)"
    
    
    static func post(id: String) -> Request {
        return Alamofire.request(.POST, endpoint, parameters: ["id": "\(id).jpg"]) .responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.request)
            debugPrint(response.result)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
            }
        }
 ;   }
    
}