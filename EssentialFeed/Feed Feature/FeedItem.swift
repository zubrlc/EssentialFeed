//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by azubreiciuc on 17.08.2023.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
