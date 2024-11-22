//
//  SnapshotCollectionModel.swift
//  KREAM
//
//  Created by jaewon Lee on 11/8/24.
//

import Foundation
import UIKit

struct SnapshotCollectionModel: SnapshotDisplayable {
  let image: UIImage
  var title: String? { nil }
  var subTitle: String? { nil }
  let hashTag: String
}

extension SnapshotCollectionModel {
  func configureView(_ view: ItemDetailView) {
    // TODO: - 스냅샷 세부 뷰 작성시 해당 함수를 통해 UI 설정
  }
}

extension SnapshotCollectionModel {
  static func snapshotCollectionData() -> [SnapshotCollectionModel] {
    return [
      SnapshotCollectionModel(image: .snapshot1, hashTag: "@katarinabluu"),
      SnapshotCollectionModel(image: .snapshot2, hashTag: "@imwinter"),
      SnapshotCollectionModel(image: .snapshot3, hashTag: "@thousand_wooo"),
      SnapshotCollectionModel(image: .snapshot1, hashTag: "@katarinabluu"),
    ]
  }
}
