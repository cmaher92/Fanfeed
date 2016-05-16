//
//  DailyViewController.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 12/10/15.
//  Copyright © 2015 Fanfeed, Inc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AVKit
import AVFoundation
import CoreGraphics

class DailyViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!

    var rightBarButtonItem: UIBarButtonItem?


    
    var videos: [Video] = [] {
        didSet {
            videos.sortInPlace({$0.votes > $1.votes})
            tableView.reloadData()
        }
    }
    
    var selectedVideo: String? = nil
    
    
//    Prior to the view appearing the all method is called which queries the API and then creates the objects
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Daily"
        loadVideos()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.addSubview(self.refreshControl)
        let postButton = UIBarButtonItem(image: UIImage(named: "add"),
            style: UIBarButtonItemStyle.Plain ,
            target: self, action: "postButtonPressed:")
        
        self.navigationItem.rightBarButtonItem = postButton

    }

    
    func loadVideos() {
        Videos.all() { (videoObjects: [Video]?) in
            if let videoObjects = videoObjects {
                self.videos = videoObjects
            }
        }
    }
    
    func postButtonPressed(sender: AnyObject?) {
        self.performSegueWithIdentifier("ShowAddPost", sender: nil)

    }
    

    
    override func viewDidAppear(animated: Bool) {
        print("appeared")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        return refreshControl
    }()
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAddPost" {
            segue.destinationViewController as! AddPostViewController
        } else {
        let playerVC = segue.destinationViewController as!AVPlayerViewController
        if selectedVideo == nil { return }
        let videoURL = NSURL(string: selectedVideo!)
        let player = AVPlayer(URL: videoURL!)
        playerVC.showsPlaybackControls = false
        playerVC.player = player
        player.play()
        }
    }
    
}
extension DailyViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as! PostTableViewCell

        let currentVideo = videos[indexPath.row]
        
        currentVideo.goGetImage { (image) -> Void in
            cell.postThumbnail.image = image
        }

        let currentVotes = String(videos[indexPath.row].votes)
        
        // jdoges new button //
//        cell.newButton.frame = CGRectMake(cell.frame.size.width - 55, cell.frame.size.height - 80, 40, 50)
//        cell.newButton.layer.cornerRadius = 3
//        cell.newButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        cell.contentView.addSubview(cell.newButton)
        cell.shitHeadButton.setTitle("\(currentVotes)", forState: UIControlState.Normal)
        cell.votes = Int(currentVotes)!
        
        cell.postTitle.text = currentVideo.title
        cell.postUser.text = videos[indexPath.row].owner!.screenName
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedVideo = videos[indexPath.row].url
        performSegueWithIdentifier("ShowPlayer", sender: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
}