//
//  AddPostViewController.swift
//  Fanfeed
//
//  Created by Connor Maher on 1/16/16.
//  Copyright © 2016 Fanfeed, Inc. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController{

    @IBOutlet weak var pasteLink: UIButton!
    @IBOutlet weak var uploadFromPhone: UIButton!
    @IBAction func pasteLinkFromClipboard(sender: AnyObject) {
        let pasteboard = UIPasteboard.generalPasteboard()
        if let link = pasteboard.string {
            print(link)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
