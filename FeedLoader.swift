//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by azubreiciuc on 17.08.2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}


protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
