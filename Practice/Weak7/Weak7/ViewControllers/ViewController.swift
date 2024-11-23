//
//  ViewController.swift
//  Weak7
//
//  Created by jaewon Lee on 11/23/24.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view.backgroundColor = .white
    self.view = apiTestView
  }

  let apiTestView = APITestView()
}

