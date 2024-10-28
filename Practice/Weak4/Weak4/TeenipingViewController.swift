//
//  ViewController.swift
//  Weak4
//
//  Created by jaewon Lee on 10/28/24.
//

import UIKit

class TeenipingViewController: UIViewController {
  private let rootView = TeenipingView()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view = rootView
  }

  private func setupAction() {
    rootView.segmentedControl.addTarget(
      self,
      action: #selector(segmentedControlValueChanged(segment: )),
      for: .valueChanged
    )
  }
  
  @objc
  private func segmentedControlValueChanged(segment: UISegmentedControl) {
    // TODO: segment 인덱스에 따라 collectionView 표시 여뷰 결정.
  }

}

