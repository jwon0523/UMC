//
//  ExplorationCollectionData.swift
//  KREAM
//
//  Created by jaewon Lee on 11/7/24.
//

import Foundation
import UIKit

struct JustDroppedCollectionModel {
  let image: UIImage
  let title: String
  let subTitle: String
  let price: String
  let priceStatus: String
}

extension JustDroppedCollectionModel {
  static func justDroppedCollectionData() -> [JustDroppedCollectionModel] {
    return [
      JustDroppedCollectionModel(
        image: .justDropped1,
        title: "MLB",
        subTitle: "청키라이너 뉴욕양키스",
        price: "139,000원",
        priceStatus: "즉시 구매가"
      ),
      JustDroppedCollectionModel(
        image: .justDropped2,
        title: "Jordan",
        subTitle: "청키라이너 뉴욕양키스",
        price: "139,000원",
        priceStatus: "즉시 구매가"
      ),
      JustDroppedCollectionModel(
        image: .justDropped3,
        title: "Human Made",
        subTitle: "청키라이너 뉴욕양키스",
        price: "139,000원",
        priceStatus: "즉시 구매가"
      ),
      JustDroppedCollectionModel(
        image: .justDropped1,
        title: "MLB",
        subTitle: "청키라이너 뉴욕양키스",
        price: "139,000원",
        priceStatus: "즉시 구매가"
      ),
    ]
  }
}
