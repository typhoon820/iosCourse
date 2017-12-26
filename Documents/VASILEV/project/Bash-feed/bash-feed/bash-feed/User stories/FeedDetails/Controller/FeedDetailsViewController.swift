//
//  FeedDetailsViewController.swift
//  NewsApps
//
//  Created by Andrey Zonov on 11/12/2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit

class FeedDetailsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var feedItem: FeedItemProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = feedItem?.title
        textView.text = feedItem?.details
        textView.textContainerInset = UIEdgeInsets(top: 20,
                                                   left: 10,
                                                   bottom: 20,
                                                   right: 10)
    }
}
