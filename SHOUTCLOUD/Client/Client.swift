//
//  Client.swift
//  SHOUTCLOUD
//
//  Created by Florian Krüger on 02/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import UIKit

/**
 THE SHOUTCLOUD CLIENT. GET YOUR INSTANCE WITH `SHOUTCLOUD.Client.sharedClient`.
 */
public class Client: NSObject {

  /// USE THIS CLIENT WHEN ATTEMPTING TO SHOUT AT YOUR USERS. OR YOUR BOSS. OR YOUR IDE. OR YOUR
  /// CAT. OR USING CAT. JUST REMEMBER TO USE THIS CLIENT WHEN YOU WANT TO SHOUT.
  public static let sharedClient = Client(networkSession: NetworkSessionImplementation.sharedSession)

  private let scheme = "HTTP"
  private let host = "API.SHOUTCLOUD.IO"
  private let currentVersionPathComponent = "/V1"
  private let networkSession: NetworkSession

  enum Service: String {
    case Shout = "SHOUT"
  }

  init(networkSession: NetworkSession) {
    self.networkSession = networkSession
  }

  /**
   THIS IS WHY WE'RE HERE: WHO DOESN'T WANT A SIMPLE WAY TO SHOUT BACK TO THE USER SOMETIMES?

   :param: message WHATEVER YOU WANT TO SHOUT
   :param: success THE BLOCK THAT THE CLOUD IS SHOUTING BACK TO
   :param: failure THIS BLOCK IS CALLED WHEN SOMETHING GOES WRONG
   */
  public func shout(message: String, success: (message: String) -> Void, failure: (error: NSError) -> Void) {
    let request = Request(input: message)
    self.POST(self.urlForService(.Shout),
      request: request,
      success: { (response) -> Void in
        success(message: response.output)
      },
      failure: failure)
  }

  // MARK: URL Building

  private func urlForService(service: Service) -> NSURL {
    if let url = NSURL(scheme: self.scheme, host: self.host, path: currentVersionPathComponent.stringByAppendingPathComponent(service.rawValue)) {
      return url
    } else {
      fatalError("couldn't build url for service \(service.rawValue)")
    }
  }

  // MARK: Network Communication

  private func POST(url: NSURL, request: Request, success: (response: Response) -> Void, failure: (error: NSError) -> Void) {
    let result = request.toJSON()

    if let json = result.json {
      var urlRequest = NSMutableURLRequest(URL: url)
      urlRequest.HTTPMethod = "POST"
      urlRequest.HTTPBody = json
      urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
      urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

      self.networkSession.dataTaskWithRequest(urlRequest) { (data, response, error) -> Void in
        if let nonOptionalError = error {
          failure(error: nonOptionalError)
        } else {
          let result = Response.fromJsonData(data)
          if let response = result.object {
            success(response: response)
          } else if let error = result.error {
            failure(error: error)
          } else {
            failure(error: NSError(domain: Constants.errorDomain, code: Constants.ErrorCodes.InvalidResponse.rawValue, userInfo: nil))
          }
        }
      }

    } else if let error = result.error {
      failure(error: error)
    } else {
      failure(error: NSError(domain: Constants.errorDomain, code: Constants.ErrorCodes.InvalidRequest.rawValue, userInfo: nil))
    }
  }
}
