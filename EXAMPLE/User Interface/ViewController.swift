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

  // MARK: - Setup & Layout

  private func setup() {
    self.title = "SHOUTCLOUD"
  }

  private func setupView() {
    self.view.backgroundColor = UIColor.whiteColor()
  }

  private func setupSubviews() {

  }

  private func setupLayout() {
    
  }
  
}

