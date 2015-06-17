//
//  Response.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import UIKit

struct Response {
  let input: String
  let output: String

  static func fromJsonData(jsonData: NSData) -> (object: Response?, error: NSError?) {

    var error: NSError?
    if let object = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.allZeros, error: &error) as? [String: String] {

      if let input = object["INPUT"], output = object["OUTPUT"] {
        return (object: Response(input: input, output: output), error: nil)
      } else {
        return (object: nil, error: NSError(domain: "SHOUTCLOUD.ERRORS", code: 1, userInfo: nil))
      }

    } else {
      return (object: nil, error: error)
    }
  }
}
