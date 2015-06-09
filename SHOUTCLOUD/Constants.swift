//
//  Constants.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 03/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import Foundation
import UIKit

public struct Constants {
  public static let errorDomain = "io.shoutcloud.error"

  public enum ErrorCodes: Int {
    case InvalidRequest = 1
    case InvalidResponse = 2
  }

  public struct Colors {
    static let black = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
    static let red = UIColor(red: 226/255, green: 98/255, blue: 98/255, alpha: 1.0)
    static let green = UIColor(red: 0/255, green: 157/255, blue: 144/255, alpha: 1.0)
    static let blue = UIColor(red: 0/255, green: 123/255, blue: 160/255, alpha: 1.0)
  }
}
