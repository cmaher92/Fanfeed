//
//  User.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 1/9/16.
//  Copyright © 2016 Fanfeed, Inc. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class User: Object {
    dynamic var picture: String = ""
    dynamic var name: String = ""
    dynamic var screenName: String = ""
    dynamic var profil: String = ""
    dynamic var votesCount: Int = 0
    dynamic var createdAt: String = ""
    dynamic var updatedAt: String = ""
    dynamic var id: String = ""
    
    convenience init(userJson: JSON) {
        self.init()
        self.name = userJson["name"].string!
        self.picture = userJson["picture"].string!
        self.name = userJson["name"].string!
        self.screenName = userJson["screenName"].string!
        self.profil = userJson["profil"].string!
        self.votesCount = userJson["votesCount"].int!
        self.createdAt = userJson["createdAt"].string!
        self.updatedAt = userJson["updatedAt"].string!
        self.id = userJson["id"].string!
    }
    
    convenience init(picture:String, name:String, screenName:String, profil:String, votesCount:Int, createdAt:String, updatedAt:String, id:String) {
        self.init()
        self.picture = picture
        self.name = name
        self.screenName = screenName
        self.profil = profil
        self.votesCount = votesCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.id = id
    }

}