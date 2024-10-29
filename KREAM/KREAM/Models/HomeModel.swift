//
//  HomeModel.swift
//  KREAM
//
//  Created by jaewon Lee on 10/29/24.
//

import Foundation
import UIKit

struct HomeModel {
  let image: UIImage
  let title: String
}

extension HomeModel {
  static func dummy() -> [HomeModel] {
    return [
      HomeModel(image: .category1, title: "크림 드로우"),
      HomeModel(image: .category2, title: "실시간 차트"),
      HomeModel(image: .category3, title: "남성 추천"),
      HomeModel(image: .category4, title: "여성 추천"),
      HomeModel(image: .category5, title: "색다른 추천"),
      HomeModel(image: .category6, title: "정가 아래"),
      HomeModel(image: .category7, title: "윤세 24AW"),
      HomeModel(image: .category8, title: "올해의 베스트"),
      HomeModel(image: .category9, title: "10월 베네핏"),
      HomeModel(image: .category10, title: "아크넷 선물"),
    ]
  }
}
