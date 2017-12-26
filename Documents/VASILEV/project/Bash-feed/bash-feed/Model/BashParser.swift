//
//  WylsaComFeedParser.swift
//  NewsApps
//
//  Created by Andrey Zonov on 11/12/2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation

class BashParser: FeedItemXMLParser {
    
    override func parse(item: inout FeedItem, using xml: XMLIndexer) {
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        if let data = item.desc.data(using: .utf8),
            let attributedString = try? NSAttributedString(data: data,
                                                           options: options,
                                                           documentAttributes: nil) {
            item.desc = attributedString.string
        }
        
        if let details = xml["content:encoded"].element?.text,
            let data = details.data(using: .utf8),
            let attributedString = try? NSAttributedString(data: data,
                                                           options: options,
                                                           documentAttributes: nil) {
            item.details = attributedString.string
        }
    }
}
