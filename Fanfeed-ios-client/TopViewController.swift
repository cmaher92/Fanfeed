//
//  TopViewController.swift
//  Fanfeed
//
//  Created by Connor Maher on 1/14/16.
//  Copyright © 2016 Fanfeed, Inc. All rights reserved.
//

import UIKit
import AlamoFire
import SwiftyJSON
import AVKit
import AVFoundation
import CoreGraphics

class TopViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
//    Sorting of videos from greatest to least votes within the last 24 hours
    var videos: [Video] = [] {
        didSet {
            videos.sortInPlace({$0.votes > $1.votes})
            tableView.reloadData()
        }
    }
    
    
    var selectedVideo: String? = nil
    
    
    //    Prior to the view appearing the all method is called which queries the API and then creates the objects
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Top"
        loadVideos()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.addSubview(self.refreshControl)
    }
    
    
    func loadVideos() {
        Videos.all() { (videoObjects: [Video]?) in
            if let videoObjects = videoObjects {
                self.videos = videoObjects
            }
        }
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
        let playerVC = segue.destinationViewController as!AVPlayerViewController
        if selectedVideo == nil { return }
        let videoURL = NSURL(string: selectedVideo!)
        let player = AVPlayer(URL: videoURL!)
        playerVC.showsPlaybackControls = false
        playerVC.player = player
        player.play()
    }
    
}
extension TopViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TopCell") as! TopTableViewCell
        
        let currentVideo = videos[indexPath.row]
        
        currentVideo.goGetImage { (image) -> Void in
            cell.topThumbnail.image = image
        }
        
        let currentVotes = String(videos[indexPath.row].votes)
        
        cell.voteButton.setTitle("\(currentVotes)", forState: UIControlState.Normal)
        cell.votes = Int(currentVotes)!
        
        cell.topTitle.text = currentVideo.title
        cell.topUser.text = videos[indexPath.row].owner!.screenName
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedVideo = videos[indexPath.row].url
        performSegueWithIdentifier("showPlayer", sender: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
}
