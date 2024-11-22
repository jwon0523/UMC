//
//  DefaultViewControllerFactory.swift
//  KREAM
//
//  Created by jaewon Lee on 11/22/24.
//

import Foundation

class DefaultViewControllerFactory<T>: ViewControllerFactory {
  typealias ViewController = T
  private let createInstance: () -> T
  
  init(createInstance: @escaping () -> T) {
    self.createInstance = createInstance
  }
  
  func createViewController() -> T {
    return createInstance()
  }
}
