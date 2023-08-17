//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by azubreiciuc on 17.08.2023.
//

import XCTest
// sut - System Under Test
class RemoteFeedLoader {
    func load() {
        HTTPCLient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPCLient {
    static let shared = HTTPCLient()
    private init() {}
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPCLient.shared
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPCLient.shared
        let sut = RemoteFeedLoader()

        // dependency injection techincs
//        let sut = RemoteFeedLoader(client) passing in constructor
//        sut.client = client // propery injection
//        sut.load(clinet: client) // method injection

        sut.load()


        XCTAssertNotNil(client.requestedURL)

    }
}
