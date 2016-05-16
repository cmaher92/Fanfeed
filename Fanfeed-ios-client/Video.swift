//
//  Video.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 1/8/16.
//  Copyright © 2016 Fanfeed, Inc. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Video: Object {
    dynamic var createdAt: String = ""
    dynamic var fileName: String = ""
    dynamic var image: String = ""
    dynamic var score: Int = 0
    dynamic var source: String = ""
    dynamic var statusForWeb: String = ""
    dynamic var title: String = ""
    dynamic var updatedAt: String = ""
    dynamic var url: String = ""
    dynamic var votes: Int = 0
    dynamic var id: String = ""
    dynamic var owner: User? = nil
    
    convenience init(item: JSON) {
        self.init()
        let userJson = item["user"]
        let mediaPath = ApiHelper.mediaPath
        let fullURL = mediaPath + item["id"].string! + ".jpg"
        let vidURL = ApiHelper.videoPath + item["id"].string! + ".mp4"
        self.createdAt = item["createdAt"].string!
        self.fileName = item["fileName"].string!
        self.image = fullURL
        self.score = item["score"].int!
        self.source = item["source"].string!
        self.statusForWeb = item["statusForWeb"].string!
        self.title = item["title"].string!
        self.updatedAt = item["updatedAt"].string!
        self.url = vidURL
        self.votes = item["votes"].int!
        self.id = item["id"].string!
        self.owner = User(userJson: userJson)
    }
    
    convenience init(createdAt: String, fileName: String, image: String, score: Int, source: String, statusForWeb: String, title: String, updatedAt: String, url: String, votes: Int, id: String, owner: User) {
        self.init()
        self.createdAt = createdAt
        self.fileName = fileName
        self.image = image
        self.score = score
        self.source = source
        self.statusForWeb = statusForWeb
        self.title = title
        self.updatedAt = updatedAt
        self.url = url
        self.votes = votes
        self.id = id
        self.owner = owner
    }
    
    func goGetImage(callback: (image: UIImage) -> Void) {
        
        if let thumbnailURL = NSURL(string: image) {
            let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
            dispatch_async(queue, { () -> Void in
                if let data = NSData(contentsOfURL: thumbnailURL) {
                    if let image = UIImage(data: data) {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            callback(image: image)
                        })
                    }
                } else {
                    print("data error")
                }
            })
        } else {
            print("url error")
        }
        
        
    }

}