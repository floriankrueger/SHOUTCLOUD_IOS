//
//  Constants.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 03/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import Foundation

public struct Constants {
  public static let errorDomain = "io.shoutcloud.error"

  public enum ErrorCodes: Int {
    case InvalidRequest = 1
    case InvalidResponse = 2
  }
}
