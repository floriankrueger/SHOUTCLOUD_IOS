//
//  RequestTests.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import UIKit
import XCTest

class RequestTests: XCTestCase {

    func testJSONSerialization() {
      let input = "hello world"
      let request = Request(input: input)
      let result = request.toJSON()

      XCTAssertNotNil(result.json, "request couldn't be decoded")
      XCTAssertNil(result.error, "request serialization lead to an error")

      if let json = result.json {
        var error: NSError?
        let decoded = NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.allZeros, error: &error) as? [String: String]

        XCTAssertNotNil(decoded, "result.json isn't valid json data")
        XCTAssertNil(error, "result.json deserialization lead to an error")

        if let nonOptionalDecoded = decoded, let decodedInput = nonOptionalDecoded["INPUT"] {
          XCTAssertEqual(decodedInput, input, "wrong data in 'INPUT'")
        } else {
          XCTFail("key 'INPUT' is obviously missing")
        }
      } else {
        XCTFail("couldn't continue due to json being nil in the first place")
      }
    }

}
