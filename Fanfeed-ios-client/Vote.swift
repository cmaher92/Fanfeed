//
//  Vote.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 1/12/16.
//  Copyright © 2016 Fanfeed, Inc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class Vote: NSObject {
        static let endpoint = "\(ApiHelper.basePath)vote"
    
    static func post(id: String) -> Request {
        return Alamofire.request(.POST, endpoint, parameters: ["id": id])
    }
}