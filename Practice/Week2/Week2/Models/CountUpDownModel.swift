//
//  CountUpDownModel.swift
//  Week2
//
//  Created by jaewon Lee on 9/26/24.
//

import Foundation

struct CountUpDownModel {
  var count: Int = 0
  
  // mutating은 구조체나 열거형 내에서 인스턴스이 프로퍼티를 수정하거나 자기 자신을 변경할 수 있게 하는 기능 제공함. 기본적으로 구조체와 열거형은 값 타입이기 때문.
  mutating func increaseCount() {
    self.count += 1
  }
  
  mutating func decreaseCount() {
    self.count -= 1
  }
}
