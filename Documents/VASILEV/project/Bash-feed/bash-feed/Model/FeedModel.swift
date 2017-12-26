//
//  FeedModel.swift
//  NewsApps
//
//  Created by xcode on 17.10.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData

class FeedModel: NSObject, XMLParserDelegate {
    
    
    struct Source {
        let parser: FeedItemParsable
        let url: URL
    }
    public var viewContext: NSManagedObjectContext
    public var saveContext: NSManagedObjectContext
    
    private var feedItemSaver: FeedItemSaver
    
    init(with container: DataBaseContainable) {
        let bash = Source(parser: BashParser(),
                           url: URL(string: "http://bash.im/rss")!)
        let lenta = Source(parser: FeedItemXMLParser(),
                           url: URL(string: "https://lenta.ru/rss/news")!)
        viewContext = container.viewContext
        saveContext = container.saveContext
        feedItemSaver = FeedItemCoreDataSaver(container: container)
        sources = [bash]
        super.init()
    }
    
    private let session = URLSession(configuration: .default)
    private let sources: [Source]
//    private lazy var coreDataManager: CoreDataManager = {
//        let manager = CoreDataManager()
//        //let context = UIApplication.container.viewContext
//        context.automaticallyMergesChangesFromParent = true
//        return manager
//    }()
//    private var saver: FeedItemSaver {
//        let container = coreDataManager.persistentContaner
//        let context = container.newBackgroundContext()
//        return FeedItemCoreDataSaver(context: context)
//    }
//    var viewContext: NSManagedObjectContext {
//        return coreDataManager.persistentContaner.viewContext
//    }
//    
    func retreiveFeed() {
        for source in sources {
            let task = session.dataTask(with: source.url)
            { (data, response, error) in
                if let data = data {
                    do {
                        let items = try source.parser.parse(data: data)
                        try self.feedItemSaver.save(feedItems: items)
                    } catch {
                        print(error)
                    }
                }
                if let error = error {
                    print(error)
                }
            }
            task.resume()
        }
    }
    func update(item: FeedItemProtocol){
        let list: [FeedItemProtocol]
        list = [item]
        do {
            try self.feedItemSaver.save(feedItems: list)
        }
        catch{
            print(error)
        }
    }
    func findFavorites() -> [FeedItemMO]?
    {
        return self.feedItemSaver.findFavorites()
    }
 
}
