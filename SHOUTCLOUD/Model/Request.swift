//
//  Request.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import UIKit

struct Request {
  let input: String

  func toJSONObject() -> [String:String] {
    return ["INPUT": self.input]
  }

  func toJSON() -> (json: NSData?, error: NSError?) {
    var error: NSError?
    if let json = NSJSONSerialization.dataWithJSONObject(self.toJSONObject(), options: NSJSONWritingOptions.allZeros, error: &error) {
      return (json: json, error: nil)
    } else {
      return (json: nil, error: error)
    }
  }
}
