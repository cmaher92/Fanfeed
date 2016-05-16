//
//  PostTableViewCell.swift
//  Fanfeed-ios-client
//
//  Created by Connor Maher on 12/9/15.
//  Copyright © 2015 Fanfeed, Inc. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postThumbnail: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postUser: UILabel!
    @IBOutlet weak var buttonNumber: UILabel!
    //@IBOutlet weak var button: UIButton!

//    var newButton = UIButton()

    @IBOutlet weak var shitHeadButton: UIButton!
    
    var votes: Int = 0 {
        didSet {
            shitHeadButton.setTitle(String(votes), forState: UIControlState.Normal)
        }
    }
    var isVoteCast = false {
        didSet {
            shitHeadButton.selected = isVoteCast
        }
    }

    func voteButtonPress() {
        votes += (isVoteCast ? -1 : 1)
        isVoteCast = !isVoteCast
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        shitHeadButton.addTarget(self, action: "voteButtonPress", forControlEvents: .TouchUpInside)
        shitHeadButton.setTitleColor(UIColor(red:0.91, green:0.3, blue:0.24, alpha:1.0), forState: .Selected)
        shitHeadButton.setTitleColor(UIColor(white:0.4, alpha:1.0), forState: .Normal)
        /*
        cell.newButton.frame = CGRectMake(cell.frame.size.width - 55, cell.frame.size.height - 80, 40, 50)
        cell.newButton.layer.cornerRadius = 3
        cell.newButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        cell.contentView.addSubview(cell.newButton)
        */
//        setButtonStateColors()
//        let buttonColor = UIColor(colorLiteralRed: 216, green: 216, blue: 216, alpha: 100)
//        self.newButton.backgroundColor = buttonColor
//        self.newButton.addTarget(self, action: "voteButtonPress", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
//    private func setButtonStateColors() {
//        self.newButton.setTitleColor(.blackColor(), forState: .Normal)
//        self.newButton.setTitleColor(.orangeColor(), forState: .Selected)
//    }
    
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
