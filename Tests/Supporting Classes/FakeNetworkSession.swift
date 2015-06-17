//
//  FakeNetworkSession.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import Foundation

class FakeNetworkSession: NSObject, NetworkSession {
  var responseObject: AnyObject?

  static var sharedSession: NetworkSession {
    get {
      return FakeNetworkSession()
    }
  }
  
  func dataTaskWithRequest(request: NSURLRequest, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) {
    var error: NSError?

    if let nonOptionalResponseObject: AnyObject = self.responseObject {
      let data = NSJSONSerialization.dataWithJSONObject(nonOptionalResponseObject, options: NSJSONWritingOptions.allZeros, error: &error)
      if let completion = completionHandler {
        completion(data, nil, error)
      }
    } else {
      if let completion = completionHandler {
        completion(nil, nil, NSError(domain: "whatever", code: 1, userInfo: nil))
      }
    }
  }
}
