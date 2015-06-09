//
//  ResponseTests.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import UIKit
import XCTest

class ResponseTests: XCTestCase {

  func testSuccessfulJSONDeserialization() {
    let input = "hello world"
    let output = "HELLO WORLD"
    let jsonObject = ["INPUT": input, "OUTPUT": output]

    var error: NSError?
    let jsonData = NSJSONSerialization.dataWithJSONObject(jsonObject, options: NSJSONWritingOptions.allZeros, error: &error)

    if let nonOptionalJsonData = jsonData {

      let response = Response.fromJsonData(nonOptionalJsonData)

      XCTAssertNil(response.error, "response.error should be nil")

      if let nonOptionalResponse = response.object {
        XCTAssertEqual(nonOptionalResponse.input, input, "INPUT doesn't contain the correct data")
        XCTAssertEqual(nonOptionalResponse.output, output, "OUTPUT doesn't contain the correct data")
      } else {
        XCTFail("couldn't continue due to response.response being nil in the first place")
      }

    } else {
      XCTFail("couldn't prepare test data")
    }
  }

}
