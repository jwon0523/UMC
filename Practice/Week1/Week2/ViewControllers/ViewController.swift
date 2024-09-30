//
//  ViewController.swift
//  Week2
//
//  Created by jaewon Lee on 9/26/24.
//

import UIKit

class ViewController: UIViewController {
  
  var data: CountUpDownModel = CountUpDownModel(count: 1)

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view = counterView
  }
  private lazy var counterView: CountUpDownView = {
          let view = CountUpDownView()
          view.countLabel.text = String(data.count)
          view.countDownButton.addTarget(self, action: #selector(decreaaseCount), for: .touchUpInside)
          view.countUpButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
          return view
      }()
      
      @objc func increaseCount() {
          self.data.increaseCount()
          self.updateCount()
      }
      
      @objc func decreaaseCount() {
          self.data.decreaseCount()
          self.updateCount()
      }
      
      private func updateCount() {
          self.counterView.countLabel.text = String(data.count)
      }

}

