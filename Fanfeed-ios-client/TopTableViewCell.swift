//
//  TopTableViewCell.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 12/22/15.
//  Copyright © 2015 Fanfeed, Inc. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var postThumbnail: UIImageView!
//    @IBOutlet weak var postTitle: UILabel!
//    @IBOutlet weak var postUser: UILabel!
//    @IBOutlet weak var buttonNumber: UILabel!
//    @IBOutlet weak var shitHeadButton: UIButton!
    @IBOutlet weak var topThumbnail: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var topUser: UILabel!
    @IBOutlet weak var topShare: UIButton!
    @IBOutlet weak var voteButton: UIButton!
    
    
    
    var votes: Int = 0 {
        didSet {
            voteButton.setTitle(String(votes), forState: UIControlState.Normal)
        }
        
    }
    var isVoteCast = false {
        didSet {
            voteButton.selected = isVoteCast
        }
    }
    
    func voteButtonPress() {
        votes += (isVoteCast ? -1 : 1)
        isVoteCast = !isVoteCast
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        voteButton.addTarget(self, action: "voteButtonPress", forControlEvents: .TouchUpInside)
        voteButton.setTitleColor(UIColor(red:0.91, green:0.3, blue:0.24, alpha:1.0), forState: .Selected)
        voteButton.setTitleColor(UIColor(white:0.4, alpha:1.0), forState: .Normal)
        
    
    }
    func viewDidLoad() {
        self.viewDidLoad()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        enum UITableViewCellSelectionStyle : Int {
            case None
            case Blue
            case Gray
            case Default
        }
        
        //        var selectionStyle = UITableViewCellSelectionStyle.None
        
    }
    
}
