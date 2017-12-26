//
//  FeedItemSaver.swift
//  NewsApps
//
//  Created by xcode on 28.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData

protocol FeedItemSaver {
    
    func save(feedItems: [FeedItemProtocol]) throws
    func findFavorites() -> [FeedItemMO]
}

class FeedItemCoreDataSaver: FeedItemSaver {
    
    //private let context: NSManagedObjectContext
    private let container: DataBaseContainable
    
    init(container: DataBaseContainable) {
        self.container = container
    }
    
    func save(feedItems: [FeedItemProtocol]) throws {
        let context = container.saveContext
        for feedItem in feedItems {
            try FeedItemMO.createOrUpdate(item: feedItem, context: context)
        }
        try context.save()
    }
    
    func findFavorites() -> [FeedItemMO]{
        let context = container.saveContext
        return try! FeedItemMO.findFavorites(context: context)
        
    }
}
