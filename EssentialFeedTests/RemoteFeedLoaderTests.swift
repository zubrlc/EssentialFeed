//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by azubreiciuc on 17.08.2023.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPCLient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPCLient()
        // sut - System Under Test
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }
}
