//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by azubreiciuc on 17.08.2023.
//

import XCTest
// sut - System Under Test
class RemoteFeedLoader {

    let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {

    func get(from url: URL) {
        requestedURL = url
    }

    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)

        // dependency injection techincs
//        let sut = RemoteFeedLoader(client) passing in constructor
//        sut.client = client // propery injection
//        sut.load(clinet: client) // method injection

        sut.load()


        XCTAssertNotNil(client.requestedURL)

    }
}
