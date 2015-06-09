//
//  NetworkSession.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import Foundation

protocol NetworkSession: NSObjectProtocol {
  static var sharedSession: NetworkSession { get }
  func dataTaskWithRequest(request: NSURLRequest, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?)
}
