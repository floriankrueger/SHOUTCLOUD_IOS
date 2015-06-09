//
//  NetworkSessionImplementation.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import Foundation

class NetworkSessionImplementation: NSObject, NetworkSession {
  private static let internalSharedSession = NetworkSessionImplementation()
  private let urlSession = NSURLSession.sharedSession()

  static var sharedSession: NetworkSession {
    get {
      return internalSharedSession
    }
  }

  func dataTaskWithRequest(request: NSURLRequest, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) {
    self.urlSession.dataTaskWithRequest(request, completionHandler: completionHandler)
  }
}
