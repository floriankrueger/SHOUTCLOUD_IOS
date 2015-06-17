//
//  ViewController.swift
//  EXAMPLE
//
//  Created by Florian Krüger on 03/06/15.
//  Copyright (c) 2015 projectserver.org. All rights reserved.
//

import UIKit
import Manuscript
import SHOUTCLOUD

class ViewController: UIViewController {

  let inputTextField = UITextField(frame: CGRectZero)
  let sendButton = UIButton.buttonWithType(.System) as! UIButton

  // MARK: - Init

  init() {
    super.init(nibName: nil, bundle: nil)
    self.setup()
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("storyboards are incompatible with truth and beauty")
  }

  // MARK: - View

  override func loadView() {
    super.loadView()
    self.setupView()
    self.setupSubviews()
    self.setupLayout()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
  }

  // MARK: - Target

  func shout() {
    let client = SHOUTCLOUD.Client.sharedClient
    client.shout(self.inputTextField.text,
      success: { message in
        dispatch_async(dispatch_get_main_queue()) {
          UIAlertView(title: "RESPONSE", message: message, delegate: nil, cancelButtonTitle: "OK").show()
        }
      },
      failure: { error in
        dispatch_async(dispatch_get_main_queue()) {
          UIAlertView(title: "ERROR", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
        }
      }
    )
  }

  // MARK: - Setup & Layout

  private func setup() {
    self.title = "SHOUTCLOUD"
  }

  private func setupView() {
    self.view.backgroundColor = UIColor.whiteColor()
  }

  private func setupSubviews() {
    self.inputTextField.backgroundColor = UIColor.whiteColor()
    self.inputTextField.placeholder = "put some text here"
    self.inputTextField.font = UIFont(name: "AvenirNext", size: 16.0)
    self.inputTextField.textColor = SHOUTCLOUD.Constants.Colors.black
    self.inputTextField.textAlignment = .Center
    self.inputTextField.layer.borderColor = SHOUTCLOUD.Constants.Colors.black.CGColor
    self.inputTextField.layer.borderWidth = 1.5
    self.inputTextField.layer.cornerRadius = 3.0
    self.inputTextField.clearButtonMode = .WhileEditing;
    self.view.addSubview(self.inputTextField)

    self.sendButton.setTitleColor(SHOUTCLOUD.Constants.Colors.red, forState: .Normal)
    self.sendButton.setTitle("SHOUT", forState: .Normal)
    self.sendButton.addTarget(self, action: "shout", forControlEvents: .TouchUpInside)
    self.view.addSubview(self.sendButton)
  }

  private func setupLayout() {
    Manuscript.layout(self.inputTextField) { c in
      c.make(.Left, equalTo: self.view, s: .Left, plus: 20.0)
      c.make(.Right, equalTo: self.view, s: .Right, minus: 20.0)
      c.make(.Top, equalTo: self.topLayoutGuide, s: .Baseline, plus: 20.0)
      c.set(.Height, to: 44.0)
    }

    Manuscript.layout(self.sendButton) { c in
      c.make(.Left, equalTo: self.view, s: .Left, plus: 20.0)
      c.make(.Right, equalTo: self.view, s: .Right, minus: 20.0)
      c.make(.Top, equalTo: self.inputTextField, s: .Bottom, plus: 20.0)
      c.set(.Height, to: 44.0)
    }
  }
  
}

