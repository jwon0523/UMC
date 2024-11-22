//
//  ViewControllerFactory.swift
//  KREAM
//
//  Created by jaewon Lee on 11/22/24.
//


protocol ViewControllerFactory {
  // 프로토콜에서는 제네릭 사용 안되기 때문에 associatedtype으로 정의
  associatedtype ViewController
  func createViewController() -> ViewController
}
