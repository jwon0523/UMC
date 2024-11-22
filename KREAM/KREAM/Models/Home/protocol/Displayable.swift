//
//  Displayable.swift
//  KREAM
//
//  Created by jaewon Lee on 11/22/24.
//

import Foundation
import UIKit

// 개방-폐쇄 원칙(OCP)과 인터페이스 분리 원칙(ISP) 준수 위한 프로토콜 정의
protocol Displayable {
  var image: UIImage { get }
  var title: String? { get }
  var subTitle: String? { get }
  func configureView(_ view: ItemDetailView)
}
