//
//  FeedItem.swift
//  NewsApps
//
//  Created by xcode on 14.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import UIKit

struct FeedItem: FeedItemProtocol {
    let title: String
    let pubDate: Date
    let link: URL
    var desc: String
    var details: String?
    var isInFavorites: Bool
}

protocol FeedItemProtocol {
    var title: String { get }
    var desc: String { get }
    var pubDate: Date { get }
    var link: URL { get }
    var details: String? { get }
    var isInFavorites : Bool { get }
}
