//
//  SaveModel.swift
//  KREAM
//
//  Created by jaewon Lee on 10/11/24.
//

import Foundation

struct SavedModel {
  let itemImage: String
  let title: String
  let description: String
  let price: String
}

final class dummySavedModel {
  static let sample: [SavedModel] = [
    SavedModel(
      itemImage: "item01",
      title: "손오공이 잃어버린 머리띠 반쪽",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "942,192,000"
    ),
    SavedModel(
      itemImage: "item02",
      title: "골드 반지",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "12,000"
    ),
    SavedModel(
      itemImage: "item03",
      title: "하얀 신발",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "230,000"
    ),
    SavedModel(
      itemImage: "item04",
      title: "에베레스트 다이아 반지",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "942,192,000"
    ),
    SavedModel(
      itemImage: "item05",
      title: "아디다스 신발",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "111,000"
    ),
    SavedModel(
      itemImage: "item06",
      title: "황제 잠옷",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "192,000"
    ),
    SavedModel(
      itemImage: "item07",
      title: "하얀 음료",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "120,000"
    ),
    SavedModel(
      itemImage: "item01",
      title: "손오공이 잃어버린 머리띠 반쪽",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "942,192,000"
    ),
    SavedModel(
      itemImage: "item02",
      title: "골드 반지",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "12,000"
    ),
    SavedModel(
      itemImage: "item03",
      title: "하얀 신발",
      description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!",
      price: "230,000"
    ),
  ]
}
