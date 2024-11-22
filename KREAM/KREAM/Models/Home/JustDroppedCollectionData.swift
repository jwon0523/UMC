//
//  ExplorationCollectionData.swift
//  KREAM
//
//  Created by jaewon Lee on 11/7/24.
//

import Foundation
import UIKit

struct JustDroppedCollectionModel: Displayable, Priced {
  let image: UIImage
  let title: String?
  let subTitle: String?
  let price: String
  let priceStatus: String
}

extension JustDroppedCollectionModel {
  func configureView(_ view: ItemDetailView) {
    view.itemImageView.image = self.image
    view.priceTitleLabel.text = self.priceStatus
    view.price = self.price
    view.itemName.text = self.title
    view.itemDescription.text = self.subTitle
  }
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
        title: "Matin Kim Logo Coating Jumper",
        subTitle: "마뗑킴 로고 코팅 점퍼 블랙",
        price: "228,000원",
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
