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
        HTTPCLient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPCLient {
    static var shared = HTTPCLient()

    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPCLient {

    override func get(from url: URL) {
        requestedURL = url
    }

    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPCLient.shared = client
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPCLient.shared = client
        let sut = RemoteFeedLoader()

        // dependency injection techincs
//        let sut = RemoteFeedLoader(client) passing in constructor
//        sut.client = client // propery injection
//        sut.load(clinet: client) // method injection

        sut.load()


        XCTAssertNotNil(client.requestedURL)

    }
}
