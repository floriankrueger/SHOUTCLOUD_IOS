//
//  ClientTests.swift
//  Tests
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import UIKit
import XCTest

class ClientTests: XCTestCase {

  var client: Client? = nil
  var fakeNetworkSession: FakeNetworkSession? = nil

  override func setUp() {
    super.setUp()
    let fakeNetworkSession = FakeNetworkSession()
    self.fakeNetworkSession = fakeNetworkSession
    self.client = Client(networkSession: fakeNetworkSession)
  }

  override func tearDown() {
    self.fakeNetworkSession = nil
    self.client = nil
    super.tearDown()
  }

  func testShout() {
    let expectation = self.expectationWithDescription("client returned")

    let inputMessage = "hello world"
    let outputMessage = "HELLO WORLD"

    self.fakeNetworkSession?.responseObject = ["INPUT": inputMessage, "OUTPUT": outputMessage]

    if let client = self.client {
      client.shout(inputMessage,
        success: { message in
          expectation.fulfill()
        },
        failure: { error in
          XCTFail("there shouldn't be an error")
        })
    } else {
      XCTFail("Test is not set up properly (self.client is nil)")
      expectation.fulfill()
    }

    self.waitForExpectationsWithTimeout(1.0) { error in
      XCTAssertNil(error, "error should be nil")
    }
  }

}
