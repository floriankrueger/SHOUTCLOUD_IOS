//
//  Constants.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 03/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import Foundation
import UIKit

/**
 THIS IS WHERE THE CONSTANTS ARE STORED. THERE'S SOMETHING ABOUT ERRORS AS WELL AS SOMETHING ABOUT
 COLORS. ENJOY.
 */
public struct Constants {

  /// THE ERROR DOMAIN FOR ALL ERRORS RETURNED BY THE SHOUTCLOUD FRAMEWORK
  public static let errorDomain = "io.shoutcloud.error"

  /// ALL POSSIBLE ERROR CODES RETURNED BY THE SHOUTCLOUD FRAMEWORK
  public enum ErrorCodes: Int {
    case InvalidRequest = 1
    case InvalidResponse = 2
  }

  /// THESE ARE THE COLORS USED ON THE OFFICIAL SHOUTCLOUD WEBSITE (AND IN THE LOGO)
  public struct Colors {
    /// THE BLACK COLOR. `#222222` IN HEX.
    public static let black = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
    /// THE RED COLOR. `#E26262` IN HEX.
    public static let red = UIColor(red: 226/255, green: 98/255, blue: 98/255, alpha: 1.0)
    /// THE GREEN COLOR. `#009D90` IN HEX.
    public static let green = UIColor(red: 0/255, green: 157/255, blue: 144/255, alpha: 1.0)
    /// THE BLUE COLOR. `#007BA0` IN HEX.
    public static let blue = UIColor(red: 0/255, green: 123/255, blue: 160/255, alpha: 1.0)
  }
}
